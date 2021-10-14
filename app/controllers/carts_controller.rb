class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @products = Cart.active.products
  end
end
