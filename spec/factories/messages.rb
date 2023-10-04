FactoryBot.define do
  factory :message do
    message { Faker::Lorem.sentence }

    association :room
    association :user
  end
end
