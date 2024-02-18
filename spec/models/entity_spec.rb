require 'rails_helper'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe Entity, type: :model do
  before do
    @user = create(:user)
  end
  subject do
    Entity.new(name: 'my first post',
               amount: 0,
               user: @user,
               group_id: 1)
  end
  before { subject.save }

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a non-numeric amount' do
    subject.amount = 'ne'
    expect(subject).to_not be_valid
  end

  it 'is not valid with an amount less than 1' do
    subject.amount = 0
    expect(subject).to_not be_valid
  end
end
