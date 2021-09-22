class CategoriesController < ApplicationController

    before_action :find_category, except: [:new,:create,:index,:search]

    def index
        @categories = Category.all
    end
    def show
        @category = Category.find(params[:id])
    end 

    def edit
        @keywords = Keyword.all
        respond_to do |f|
            f.js
        end
        #@category = Category.find(params[:id])
    end 

    def new
        @keywords = Keyword.all
        @category = Category.new
        respond_to do |f|
            f.js
        end
        #demostracion @category.name='Horror'
    end

    def update
        @category = Category.find(params[:id])
        @category.update(name:params[:category][:name])
        redirect_to root_path
    end

    def search
        @parameter = params[:search].downcase
        if @parameter.blank?
          @results = nil
        else
          puts @parameter
          #@results = Category.all.where("lower(name) LIKE:search", search:"%#{@parameter}%")
          @results = Category.joins(:keywords).where("lower(text) LIKE:search", search:"%#{@parameter}%").distinct()
        end
      end

    def create
        @category = Category.find_or_create_by(name:params[:category][:name])
        redirect_to root_path
    end

    def destroy
        @category.destroy
        redirect_to root_path
    end

    def find_category
        @category = Category.find(params[:id])
        puts "Estoy en find category"
    end

end
