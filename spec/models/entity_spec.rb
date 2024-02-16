require 'rails_helper'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe Entity, type: :model do
  before do
    @user = create(:user)
  end

  it 'is valid with valid attributes' do
    group = build(:group, user: @user)
    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    entity = build(:entity, name: nil, user: @user)
    expect(entity).to_not be_valid
  end

  it 'is not valid without an amount' do
    entity = build(:entity, amount: nil, user: @user)
    expect(entity).to_not be_valid
  end

  it 'is not valid with a non-numeric amount' do
    entity = build(:entity, amount: 'abc', user: @user)
    expect(entity).to_not be_valid
  end

  it 'is not valid with an amount less than 1' do
    entity = build(:entity, amount: 0, user: @user)
    expect(entity).to_not be_valid
  end
end
