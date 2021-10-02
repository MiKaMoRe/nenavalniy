require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to belong_to :author }

  it { is_expected.to have_many(:products).dependent(:destroy).through(:orders_products) }

  it { is_expected.to validate_presence_of :price }
  it { is_expected.to validate_presence_of :status }
end
