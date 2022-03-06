class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:add_to_cart]
  before_action :find_cart, only: [:add_to_cart]
  before_action :find_product, only: [:add_to_cart, :show]

  def index
    @products ||= Product.all
  end
  
  def show; end

  def add_to_cart
    @cart.carts_products.build.update(product: @product)
  end

  private

  def find_cart
    @cart = Cart.find(params[:cart])
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
