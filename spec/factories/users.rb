FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    email
    password { 'simplepass' }
    password_confirmation { 'simplepass' }
  end
end
