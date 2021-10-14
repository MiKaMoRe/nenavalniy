require 'rails_helper'

RSpec.describe CartsProduct, type: :model do
  it { is_expected.to belong_to :order }
  it { is_expected.to belong_to :product }
end
