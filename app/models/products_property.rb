class ProductsProperty < ApplicationRecord
  belongs_to :property
  belongs_to :product
end
