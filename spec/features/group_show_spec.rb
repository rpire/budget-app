RSpec.describe 'Categories', type: :feature do
  include Mocks

  before(:each) do
    generate_user
    generate_group
    generate_entity
    log_in
    visit group_path(@group.id)
  end

  describe 'Transactions page' do
    it 'displays the generated entity' do
      expect(page).to have_content @entity.name
    end

    it 'displays the total category amount' do
      expect(page).to have_content '4.99'
    end

    it 'goes to the new transaction page' do
      click_button 'New Transaction'
      expect(page).to have_current_path(new_entity_path)
    end
  end
end
