FactoryBot.define do
  factory :item do
    name              { Faker::Name.initials(number:40)}
    text              { Faker::Lorem.characters(number: 1000, min_alpha: 1)}
    category          { Category.all.sample }
    condition         { Condition.all.sample }
    prefecture        { Prefecture.all.sample }
    shipping_day      { ShippingDay.all.sample }
    shipping_fee      { ShippingFee.all.sample }
    price             { Faker::Number.between(from: 300, to: 9999999)}
  end
end
