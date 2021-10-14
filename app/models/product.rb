class Product < ApplicationRecord
  has_many :orders_products
  has_many :carts, through: :orders_products, dependent: :destroy

  validates :article, :name, :price, :amount, presence: true
end
