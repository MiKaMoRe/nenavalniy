require 'rails_helper'

RSpec.describe Property, type: :model do
  it { is_expected.to have_many(:products_properties) }
  it { is_expected.to have_many(:products).dependent(:destroy).through(:products_properties) }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :value }
end
