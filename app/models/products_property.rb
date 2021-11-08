class ProductsProperty < ApplicationRecord
  belongs_to :property
  belongs_to :product

  validates :value, presence: true
end
