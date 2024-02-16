# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'testname', password: 'nessrine2019', email: 'macherki.nessrine@gmail.com') }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'has many entities' do
    association = described_class.reflect_on_association(:entities)
    expect(association.macro).to eq(:has_many)
  end

  it 'has many groups' do
    association = described_class.reflect_on_association(:groups)
    expect(association.macro).to eq(:has_many)
  end

  it 'includes Devise modules' do
    should respond_to(:encrypted_password)
    should respond_to(:confirmation_token)
    should respond_to(:reset_password_token)
  end
end
