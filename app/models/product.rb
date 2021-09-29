class Product < ApplicationRecord
  validates :article, :name, :price, :amount, presence: true
end
