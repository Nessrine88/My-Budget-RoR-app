# spec/views/groups/new.html.erb_spec.rb
require 'rails_helper'

RSpec.describe 'groups/new', type: :view do
  let(:group) { build(:group) }

  before do
    assign(:group, group)
  end
  RSpec.configure do |config|
    config.include FactoryBot::Syntax::Methods
    config.include Devise::Test::IntegrationHelpers, type: :feature
  end

  it 'displays a form for creating a new group' do
    render

    expect(rendered).to have_selector("form[action='#{groups_path}'][method='post']") do |form|
      expect(form).to have_selector('.mb-3 label[for="group_name"].form-label', text: 'Name')
      expect(form).to have_selector('.mb-3 input[type="text"].form-control[name="group[name]"][required="required"]')

      expect(form).to have_selector('.mb-3 label[for="group_icon_url"].form-label', text: 'Icon URL')
      expect(form).to have_selector('.mb-3 input[type="text"].form-control[name="group[icon_url]"][required="required"]')

      expect(form).to have_selector('.but input[type="submit"].btn.btn-primary[value="Create Group"]')
    end
  end

  it 'displays error messages if there are any' do
    group.errors.add(:name, 'Name cannot be blank')
    group.errors.add(:icon_url, 'Icon URL cannot be blank')

    render

    expect(rendered).to have_selector('.alert.alert-danger') do |alert|
      expect(alert).to have_selector('h4', text: '2 errors prohibited this group from being saved:')
      expect(alert).to have_selector('ul') do |ul|
        expect(ul).to have_selector('li', text: 'Name Name cannot be blank')
        expect(ul).to have_selector('li', text: 'Icon URL Icon URL cannot be blank')
      end
    end
  end
end
