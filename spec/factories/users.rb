FactoryBot.define do
  factory :user do
    nickname              {Faker::JapaneseMedia::FmaBrotherhood.character}
    email                 {Faker::Internet.email}
    password              {Faker::Lorem.characters(number: 10, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    last_name             {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    last_name_kana        {Gimei.name.last.katakana}
    first_name_kana       {Gimei.name.first.katakana}
    birthday              {Faker::Date.birthday(min_age: 5, max_age: 92)}
  end
end