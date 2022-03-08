class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:add_to_cart]
  before_action :find_cart, only: [:add_to_cart]
  before_action :find_product, only: [:add_to_cart, :show]

  def index
    @products ||= Product.all
  end
  
  def show; end

  def add_to_cart
    if @product.available?
      @product.reduce
      @cart.carts_products.build.update(product: @product)

      respond_to do |f|
        f.js {}
      end
    end
  end

  private

  def find_cart
    @cart = Cart.find(params[:cart])
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
