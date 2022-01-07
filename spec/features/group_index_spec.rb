require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  include Mocks

  before(:each) do
    generate_user
    generate_group
    generate_entity
    log_in
  end

  describe 'Categories page' do
    it 'displays the generated category' do
      expect(page).to have_content @group.name
    end

    it 'displays the total category amount' do
      expect(page).to have_content '4.99'
    end

    it 'goes to the transactions page' do
      click_on 'View transactions'
      expect(page).to have_current_path(group_path(@group.id))
    end

    it 'goes to the new category page' do
      click_button 'New Category'
      expect(page).to have_current_path(new_group_path)
    end
  end
end
