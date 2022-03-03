class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :carts, dependent: :destroy

  def add_product(product)
    current_cart.products.append(product)
  end

  def active_cart
    carts.active.first
  end
end
