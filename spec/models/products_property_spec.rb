require 'rails_helper'

RSpec.describe ProductsProperty, type: :model do
  it { is_expected.to belong_to :product }
  it { is_expected.to belong_to :property }

  it { is_expected.to validate_presence_of :value }
end
