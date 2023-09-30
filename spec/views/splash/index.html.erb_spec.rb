require 'rails_helper'

RSpec.describe 'Splash/Index.', type: :system do
  describe 'splash index page' do
    before do
      visit root_path
    end
    it 'Has app name' do
      expect(page).to have_content('Frugal Funds')
    end
    it 'Redirects to the log in page when the login button is clicked' do
      click_link 'Log in'
      expect(page).to have_current_path(new_user_session_path)
    end
    it 'Redirects to the sign up page when the login button is clicked' do
      click_link 'Sign up'
      expect(page).to have_current_path(new_user_registration_path)
    end
  end
end
