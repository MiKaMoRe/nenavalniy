class Admin::CartsController < Admin::BaseController
  def index
    @carts = Cart.where(is_order: true)
  end

  def destroy
    @cart = Cart.find(params[:id])

    if @cart.destroy
      flash[:notice] = 'Order was successfully deleted'
    else
      flash[:alert] = @cart.errors.full_messages
    end

    redirect_to admin_carts_path
  end
end
