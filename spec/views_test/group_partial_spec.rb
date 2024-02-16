require 'rails_helper'
RSpec.configure do |config|
    config.include FactoryBot::Syntax::Methods
    config.include Devise::Test::IntegrationHelpers, type: :feature
end

RSpec.describe 'groups/_group', type: :view do
  let(:group) { create(:group) }

  it 'displays the category image with the correct URL' do
    render partial: 'groups/group', locals: { group: group }
    expect(rendered).to have_css("img[src='#{group.icon}']")
  end

  it 'displays the category name' do
    render partial: 'groups/group', locals: { group: group }
    expect(rendered).to have_content(group.name)
  end
end
