# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to have_many(:orders).dependent(:destroy).through(:orders_products) }

  it { is_expected.to validate_presence_of :article }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :price }
  it { is_expected.to validate_presence_of :amount }
end
