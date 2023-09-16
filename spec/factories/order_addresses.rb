FactoryBot.define do
  factory :order_address do
    post_code     { Faker::Number.number(digits: 7).to_s.insert(3, '-') }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city          { Gimei.address.kanji }
    house_number  { Faker::Number.number(digits: 3) }
    building      { Faker::Games::Zelda.location }
    phone_number  { Faker::Number.number(digits: 10) }
    token         { "tok_abcdefghijk00000000000000000" }
  end
end
