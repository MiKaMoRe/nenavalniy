class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :find_cart, only: [:show, :one_more_product, :one_less_product]

  def show
    @carts_products = @cart.carts_products.select(:product_id).group(:product_id).count.map do |carts_product|
      {
        product: Product.find(carts_product[0]),
        count: carts_product[1]
      }
    end
  end

  def one_more_product
    @cart.carts_products.where(product: params[:product]).create!

    redirect_to @cart
  end

  def one_less_product
    @cart.carts_products.where(product: params[:product]).first.destroy
    redirect_to @cart
  end

  private

  def find_cart
    @cart = Cart.find(params[:id])
  end
end
