require 'rails_helper'

RSpec.describe 'Group/Index', type: :system do
  describe 'group index page' do
    before do
      @test_user = User.create(name: 'John', email: 'admin@test.com', password: 'test12')
      @test_group = Group.create(author: @test_user, name: 'test-group', icon: 'https://placehold.co/100x100')
      Group.create(author: @user, name: 'test-group1', icon: 'https://placehold.co/100x100')
      visit groups_path
      fill_in 'Email', with: @test_user.email
      fill_in 'Password', with: @test_user.password
      click_button 'Log in'
    end
    it 'Has a list of available groups' do
      expect(page).to have_content('test-group')
      expect(page).to have_content('test-group1')
    end
    it 'Has a group icon' do
      expect(page).to have_css("img[src='https://placehold.co/100x100']")
    end
    it 'Redirects to the group show page when the group is clicked on' do
      click_link 'test-group'
      expect(page).to have_current_path(group_path(@test_group))
    end
  end
end
