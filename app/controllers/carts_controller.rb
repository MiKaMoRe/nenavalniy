class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :one_more_product, :one_less_product, :remove_product]
  before_action :find_cart, only: [:show, :one_more_product, :one_less_product, :remove_product, :order]

  def show
    @carts_products = @cart.products.uniq.map do |product|
      {
        product: product,
        count: @cart.products.where(id: product.id).count
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

  def remove_product
    @cart.carts_products.where(product: params[:product]).destroy_all

    redirect_to @cart
  end

  def order
    @cart.update(is_active: false, is_order: true)

    if @cart.save
      flash[:notice] = 'Order successfully created'
    else
      flash[:alert] = 'Order canceled'
    end

    @cart = current_user.carts.build
    @cart.update(is_active: true)

    if @cart.save
      flash[:notice] = 'New cart successfully craeated'
    else
      flash[:alert] = 'Cant create cart'
    end

    redirect_to @cart
  end

  private

  def find_cart
    @cart = Cart.find(params[:id])
  end
end
