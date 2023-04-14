FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'aassdd123' }
    password_confirmation { 'aassdd123' }
  end
end
