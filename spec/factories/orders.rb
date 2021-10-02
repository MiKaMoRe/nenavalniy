# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    price { 1 }
    status { "MyString" }
  end
end
