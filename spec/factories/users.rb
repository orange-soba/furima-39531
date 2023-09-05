FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password}
    password_confirmation {password}
    last_name             {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    last_name_kana        {Gimei.name.last.katakana}
    first_name_kana       {Gimei.name.first.katakana}
    birthday              {Faker::Date.birthday(min_age: 5, max_age: 92)}
  end
end