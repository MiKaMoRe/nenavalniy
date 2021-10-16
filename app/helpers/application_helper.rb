module ApplicationHelper
  def current_cart
    if current_user
      current_user.carts.active
    else
      Cart.new(id: 1)
    end
  end
end
