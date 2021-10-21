FactoryBot.define do
  factory :cart do
    is_active { true }
    is_order { true }
    user
  end
end
