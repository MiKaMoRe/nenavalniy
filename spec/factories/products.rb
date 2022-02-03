# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    article { '837324' }
    name { 'ProductName' }
    description { 'ProductDescription' }
    price { 100 }
    amount { 200 }
  end

  trait :out_of_stock do
    amount { 0 }
  end
end
