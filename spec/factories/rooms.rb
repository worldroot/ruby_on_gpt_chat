FactoryBot.define do
  factory :room do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    association :user
  end
end
