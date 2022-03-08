module ApplicationHelper
  def current_cart
    current_user ? current_user.carts.active : 0
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
