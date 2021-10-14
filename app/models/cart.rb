class Cart < ApplicationRecord
  belongs_to :user

  has_many :carts_products
  has_many :products, through: :carts_products, dependent: :destroy

  validates :status, presence: true

  scope :active, -> { where(status: 'active').first }

  def price
    
  end
end
