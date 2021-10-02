class Order < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'

  has_many :orders_products
  has_many :products, through: :orders_products, dependent: :destroy

  validates :price, :status, presence: true
end
