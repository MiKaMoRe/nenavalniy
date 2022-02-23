FactoryBot.define do
  factory :products_property do
    product
    property
    value { 'MyValue' }
  end
end
