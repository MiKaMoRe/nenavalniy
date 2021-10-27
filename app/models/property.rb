class Property < ApplicationRecord
  has_many :products_properties
  has_many :products, through: :products_properties, dependent: :destroy

  validates :name, :value, presence: true
end
