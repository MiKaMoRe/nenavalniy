FactoryBot.define do
  factory :cart do
    is_order { true }
    user
  end
end
