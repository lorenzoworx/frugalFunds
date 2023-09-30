require 'rails_helper'

RSpec.describe 'Group/create', type: :system do
  describe 'create group page' do
    before do
      @test_user = User.create(name: 'John', email: 'admin@test.com', password: 'test12')
      # @product = Product.new(author: @user, name: "test product", amount: 20, groups: [@group])
      # @product.save
      visit new_group_path
      fill_in 'Email', with: @test_user.email
      fill_in 'Password', with: @test_user.password
      click_button 'Log in'

      fill_in 'Name', with: "test-group"
      fill_in 'Icon', with: "https://placehold.co/100x100"
      click_button 'Create'
    end
    it 'Has a group name' do
      expect(page).to have_content('test-group')
    end
    it 'Has a group Icon' do
      expect(page).to have_css("img[src='https://placehold.co/100x100']")
    end
  end
end