class CartsProduct < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  scope :amount, -> { select(:product_id).group(:product_id).count }
end
