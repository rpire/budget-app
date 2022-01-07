require 'rails_helper'

RSpec.describe 'Log in', type: :feature do
  include Mocks

  describe 'Log in page' do
    it 'has the "Log in" button' do
      visit user_session_path
      expect(page).to have_button 'Log in'
    end

    it 'has password and username inputs' do
      visit user_session_path
      expect(page).to have_field 'Email'
      expect(page).to have_field 'Password'
    end

    it 'displays an error when submitting without filling the fields' do
      visit user_session_path
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    it 'displays an error when submitting an incorrect Email or password' do
      generate_user
      visit user_session_path
      fill_in 'Email', with: 'wrong@email.com'
      fill_in 'Password', with: 'wrongpassword'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password'
    end

    it 'Logs in successfully' do
      generate_user
      visit user_session_path
      log_in
      expect(page).to have_current_path(groups_path)
    end
  end
end
