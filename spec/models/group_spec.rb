require 'rails_helper'
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe Group, type: :model do
  before do
    @user = create(:user)
  end

  it 'is valid with valid attributes' do
    group = build(:group, name: 'Test Group', icon: 'link_of_icon')
    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    group = build(:group, name: nil, icon: 'link_of_icon')
    expect(group).to_not be_valid
  end

  it 'is not valid without an icon' do
    group = build(:group, name: 'Test Group', icon: nil)
    expect(group).to_not be_valid
  end

  it 'belongs to a user' do
    association = described_class.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'has many entities' do
    association = described_class.reflect_on_association(:entities)
    expect(association.macro).to eq(:has_and_belongs_to_many)
  end
end
