class ProductsController < ApplicationController

  # GET /products
  def index
    @c_products = session[:c_products]
    @products = Product.all
  end

end
