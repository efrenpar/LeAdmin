class HomeController < ApplicationController
  def index
    @categories = Category.all
    @stores = Store.all
    @products = Product.all
    @keywords = Keyword.all
  end
end
