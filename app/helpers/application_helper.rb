module ApplicationHelper
  def current_cart
    current_user.carts.active
  end
end
