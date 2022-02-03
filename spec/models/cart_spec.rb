require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { is_expected.to belong_to :user }

  it { is_expected.to have_many :carts_products }
  it { is_expected.to have_many(:products).dependent(:destroy).through(:carts_products) }
end
