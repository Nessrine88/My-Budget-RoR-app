require 'rails_helper'

RSpec.describe EntitiesController, type: :controller do
  let(:user) { User.create(name: 'John', email: 'john@example.com', password: 'password') }
  let(:group) { Group.create(name: 'Group 1', icon: 'icon', user:) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index, params: { group_id: group.id }

      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'assigns a new entity to @entity' do
      get :new, params: { group_id: group.id }

      expect(assigns(:entity)).to be_a_new(Entity)
    end

    it 'renders the new template' do
      get :new, params: { group_id: group.id }

      expect(response).to render_template('new')
    end
  end
end
