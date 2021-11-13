# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to have_many :carts_products }
  it { is_expected.to have_many :products_properties }
  it { is_expected.to have_many(:carts).dependent(:destroy).through(:carts_products) }
  it { is_expected.to have_many(:properties).dependent(:destroy).through(:products_properties) }

  it { is_expected.to validate_presence_of :article }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :price }
  it { is_expected.to validate_presence_of :amount }

  describe '#available?' do
    let(:product) { create(:product) }

    context 'when product is available' do
      it { expect(product.available?).to be_truthy }
    end

    context 'when product out of stock' do
      before { product.update(amount: 0) }

      it { expect(product.available?).to be_falsey }
    end
  end
end
