require 'rails_helper'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe GroupsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe 'GET #new' do
    it 'assigns a new @group' do
      get :new
      expect(assigns(:group)).to be_a_new(Group)
    end
  end

  describe 'GET #index' do
    it 'assigns @groups' do
      group1 = create(:group, user:, name: 'Group 1', icon: 'icon')
      group2 = create(:group, user:, name: 'Group 2', icon: 'icon')

      get :index

      expect(assigns(:groups)).to eq([group1, group2]), 'Expected @groups to contain the created groups'
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new group' do
        group_params = { group: { name: 'Group 1', icon: 'icon' } }

        expect do
          post :create, params: group_params
        end.to change(Group, :count).by(1), 'Expected Group count to increase by 1'
      end
    end
  end
end
