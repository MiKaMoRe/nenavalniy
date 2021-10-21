# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to have_many :carts_products }
  it { is_expected.to have_many(:carts).dependent(:destroy).through(:carts_products) }

  it { is_expected.to validate_presence_of :article }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :price }
  it { is_expected.to validate_presence_of :amount }
end
