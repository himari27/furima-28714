FactoryBot.define do
  factory :order_purchase do
    token             { "test" }
    post_code         { "631-0021" }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    city              { Faker::Address.city }
    address           { Gimei.town.kanji }
    phone_number      { Faker::Number.number(11)}
  end
end
