FactoryBot.define do
  factory :comment do
    comment { Faker::Lorem.sentence }

    association :item
    association :user
  end
end
