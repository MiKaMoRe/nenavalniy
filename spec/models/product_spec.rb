# frozen_string_literal: true

RSpec.describe Product, type: :model do
  it { is_expected.to validate_presence_of :article }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :price }
  it { is_expected.to validate_presence_of :amount }
end
