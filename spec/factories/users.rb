FactoryBot.define do
  factory :user do
    name { Faker::Lorem.word }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    confirmed_at { Time.current }
  end
end
