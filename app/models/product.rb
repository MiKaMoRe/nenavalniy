class Product < ApplicationRecord
  has_many :carts_products
  has_many :products_properties
  has_many :carts, through: :carts_products, dependent: :destroy
  has_many :properties, through: :products_properties, dependent: :destroy

  validates :article, :name, :price, :amount, presence: true
end
