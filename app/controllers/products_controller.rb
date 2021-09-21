class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @categories = Category.all
    @stores = Store.all
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @stores = Store.all
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.save_stores
    respond_to do |format|
      if @product.save
        format.html { redirect_to root_path, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        @product.save_stores
        format.html { redirect_to root_path, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @parameter = params[:search].downcase
    if @parameter.blank?
      @results = nil
    elsif @parameter == "all_categories"
      @results = Product.joins(:category)
    elsif @parameter == "all_stores"
      @results = Product.joins(:stores)
    elsif @parameter.include? "category_"
      @token = @parameter.split("_")
      @results = Product.all.where("category_id = :search", search:Integer(@token[1]))
    elsif @parameter.include? "store_"
      @token = @parameter.split("_")
      @results = Product.joins(:has_products).where("store_id = :search", search:@token[1])
    else
      puts @parameter
      @results = Product.all.where("lower(name) LIKE:search", search:"%#{@parameter}%")
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :color, :size, :price, :category_id, store_elements: [])
    end
end
