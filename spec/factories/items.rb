FactoryBot.define do
  factory :item do
    name { Faker::Lorem.string }
    explanation { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 10) }
    condition_id { Faker::Number.between(from: 1, to: 6) }
    fee_id { Faker::Number.between(from: 1, to: 2) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    shipping_day_id { Faker::Number.between(from: 1, to: 3) }
    price           { Faker::Number.between(from: 300, to: 9999999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open("app/assets/images/item-sample.png", filename: "item-sample.png"))
    end
  end
end
