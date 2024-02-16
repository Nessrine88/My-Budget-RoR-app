require 'rails_helper'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::IntegrationHelpers, type: :feature
end

RSpec.feature 'Entities', type: :feature do
  before do
    create(:user)
  end

  scenario 'User views entities in a group' do
    user = create(:user)
    login_as(user, scope: :user)

    group = create(:group, user:)
    entities = create_list(:entity, 3, group:, user:)
    visit group_entities_path(group)
    expect(page).to have_content('Back to Categories')

    if entities.any?
      entities.each do |entity|
        expect(page).to have_content(entity.name)
        expect(page).to have_content(entity.amount)
      end
      expect(page).to have_content("Total amount: #{entities.sum(&:amount)}")
    else
      expect(page).to have_content('No entities in this group yet.')
    end

    expect(page).to have_link('Add New', href: new_group_entity_path(group))
  end
end
