FactoryBot.define do
  factory :item do
    user_id           { 1 }
    name              { Faker::Name.initials(number: 40) }
    text              { Faker::Lorem.characters(number: 1000, min_alpha: 1) }
    category_id          { Faker::Number.between(from: 2, to: 10) }
    condition_id         { Faker::Number.between(from: 2, to: 7) }
    prefecture_id        { Faker::Number.between(from: 2, to: 48) }
    shipping_day_id      { Faker::Number.between(from: 2, to: 4) }
    shipping_fee_id      { Faker::Number.between(from: 2, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    # association :user
  end
end
