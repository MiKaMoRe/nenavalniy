class Cart < ApplicationRecord
  belongs_to :user

  has_many :carts_products
  has_many :products, through: :carts_products, dependent: :destroy

  validates :is_active, :is_order, presence: true

  scope :active, -> { where(is_active: true).first }

  def price
    
  end
end
