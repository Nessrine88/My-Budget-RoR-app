FactoryBot.define do
  factory :group do
    name { 'Example Group' }
    icon { 'group_icon.jpg' }
    user
  end
end
