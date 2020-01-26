FactoryBot.define do
  factory :post do
    content {"こんにちは！！"}
    created_at { Faker::Time.between(from: DateTime.now - 3, to: DateTime.now) }
    user
  end
end