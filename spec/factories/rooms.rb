FactoryBot.define do
  factory :room do
    created_at { Time.now }
    limit      { (created_at + 2.week).end_of_day }

    association :item
  end
end
