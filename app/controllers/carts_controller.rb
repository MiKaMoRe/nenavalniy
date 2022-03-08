class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :increase_product, :reduce_product, :remove_product, :order]
  before_action :find_cart, only: [:show, :increase_product, :reduce_product, :remove_product, :order]
  before_action :find_product, only: [:increase_product, :reduce_product, :remove_product]
  before_action :find_carts_products, only: [:show, :increase_product, :reduce_product, :remove_product]
  before_action :active_cart_owner?, only: [:show]

  def show; end

  def increase_product
    if @product.available?
      @cart.carts_products.where(product: params[:product]).create!
      @product.reduce

      respond_to do |f|
        f.js {}
      end
    end
  end

  def reduce_product
    @cart.carts_products.where(product: params[:product]).first.destroy
    @product.increase

    respond_to do |f|
      f.js {}
    end
  end

  def remove_product
    carts_products = @cart.carts_products.where(product: params[:product])
    @product.increase(carts_products.count)
    carts_products.destroy_all

    respond_to do |f|
      f.js {}
    end
  end

  def order
    if @cart.empty?
      flash[:alert] = 'Ваша корзина пуста'
    else
      @cart.update(is_order: true)

      if @cart.save
        flash[:notice] = 'Order successfully created'

        @cart = current_user.carts.build
    
        if @cart.save
          flash[:notice] = 'New cart successfully craeated'
        else
          flash[:alert] = 'Cant create cart'
        end
      else
        flash[:alert] = 'Order canceled'
      end
    end

    redirect_to @cart
  end

  private

  def active_cart_owner?
    redirect_to @cart unless params[:id].to_i == @cart.id
  end

  def find_cart
    @cart = current_user.active_cart
  end

  def find_carts_products
    @carts_products = @cart.carts_products
  end

  def find_product
    @product = Product.find(params[:product])
  end
end
