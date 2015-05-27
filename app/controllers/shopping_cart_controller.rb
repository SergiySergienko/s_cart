class ShoppingCartController < ApplicationController
  before_action :prepare_cart

  def index
    @order = DiscountsManager.get_order(@c_products)
    @products = @order.products
  end

  def add
    pid = params[:id].to_s
    @c_products[pid] = {qty: 0} unless @c_products.has_key?(pid)
    @c_products[pid][:qty] += 1
    redirect_to :back
  end

  def inc
    pid = params[:id].to_s
    @c_products[pid][:qty] += 1
    redirect_to :back
  end

  def dec
    pid = params[:id].to_s
    @c_products[pid][:qty] -= 1
    @c_products.delete(pid) if @c_products[pid][:qty] <= 0
    redirect_to :back
  end

  def drop
    pid = params[:id].to_s
    @c_products.delete(pid) if @c_products.has_key?(pid)
    redirect_to :back
  end

  def clear
    session[:c_products] = {}
    redirect_to :back
  end

  private

  def prepare_cart
    session[:c_products] ||= {}
    @c_products = session[:c_products]
  end

end
