FactoryBot.define do
  factory :group do
    name { Faker::Lorem.word }
    icon { Faker::Internet.url }
    user
  end
end
