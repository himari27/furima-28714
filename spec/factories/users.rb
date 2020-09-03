FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"夏"}
    first_name            {"春"}
    family_name_kana      {"ナツ"}
    first_name_kana       {"ハル"}
    birthday              {Faker::Date.birthday}
  end
end