class Product < ApplicationRecord
  has_many :carts_products
  has_many :products_properties
  has_many :carts, through: :carts_products, dependent: :destroy
  has_many :properties, through: :products_properties, dependent: :destroy

  has_one_attached :image

  validates :article, :name, :price, :amount, presence: true

  def available?
    amount != 0
  end

  def increase(times = 1)
    update(amount: amount + times)
  end

  def reduce(times = 1)
    update(amount: amount - times)
  end
end
