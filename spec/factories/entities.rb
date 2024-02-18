FactoryBot.define do
  factory :entity do
    name { 'Example Entity' }
    amount { 100.0 }
    association :group
    user
  end
end
