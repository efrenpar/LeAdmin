class CategoriesController < ApplicationController

    before_action :find_category, except: [:new,:create,:index]

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

    def create
        @category = Category.create(name:params[:category][:name])
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
