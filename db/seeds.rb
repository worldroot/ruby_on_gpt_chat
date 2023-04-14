require 'faker'

10.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'aassdd123',
    password_confirmation: 'aassdd123'
  )

  10.times do
    user.rooms.create!(
      title: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph
    )
  end
end
user = User.create!(name: 'RToledo DEV', email: 'rodrigo@rtoledo.inf.br', password: ENV.fetch('DEFAULT_PASSWORD', nil),
                    password_confirmation: ENV.fetch('DEFAULT_PASSWORD', nil))
user.rooms.create!(
  title: Faker::Lorem.sentence(word_count: 3),
  description: Faker::Lorem.paragraph
)

user = User.create!(name: 'Admin', email: 'admin@test.com', password: ENV.fetch('DEFAULT_PASSWORD', nil),
                    password_confirmation: ENV.fetch('DEFAULT_PASSWORD', nil))
user.rooms.create!(
  title: Faker::Lorem.sentence(word_count: 3),
  description: Faker::Lorem.paragraph
)
