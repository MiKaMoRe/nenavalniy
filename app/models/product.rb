class Product < ApplicationRecord
  has_many :carts_products
  has_many :carts, through: :carts_products, dependent: :destroy

  validates :article, :name, :price, :amount, presence: true
end
