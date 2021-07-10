FactoryBot.define do
  factory :review do
    text { Faker::Lorem.sentence }
    achievement_id { 2 }
    association :user
  end
end
