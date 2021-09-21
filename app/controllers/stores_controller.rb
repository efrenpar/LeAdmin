class StoresController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_store, only: %i[ show edit update destroy ]

  # GET /stores or /stores.json
  def index
    @stores = Store.all
  end

  # GET /stores/1 or /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @products = Product.all
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
    @products = Product.all
  end

  # POST /stores or /stores.json
  def create
    @store = Store.new(store_params)
    @store.save_products
    respond_to do |format|
      if @store.save
        format.html { redirect_to root_path, notice: "Store was successfully created." }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1 or /stores/1.json
  def update
    
    respond_to do |format|
      if @store.update(store_params)
        @store.save_products
        format.html { redirect_to root_path, notice: "Store was successfully updated." }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1 or /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Store was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def store_params
      params.require(:store).permit(:name, :street, :number, :zip_code, :city, :country, product_elements: [])
    end
end
