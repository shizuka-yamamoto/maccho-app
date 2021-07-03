FactoryBot.define do
  factory :target do
    content { Faker::Lorem.sentence }
    association :user
  end
end
