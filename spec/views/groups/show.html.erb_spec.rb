require 'rails_helper'

RSpec.describe 'Group/show', type: :system do
  describe 'group show page' do
    before do
      @test_user = User.create(name: 'John', email: 'admin@test.com', password: 'test12')
      @test_group = Group.create(author: @test_user, name: 'test-group', icon: 'https://placehold.co/100x100')
      @test_product = Product.new(author: @test_user, name: 'test-product', amount: 30, groups: [@test_group])

      @test_product.save
      visit group_path(@test_group)
      fill_in 'Email', with: @test_user.email
      fill_in 'Password', with: @test_user.password
      click_button 'Log in'
    end
    it 'Has a group name' do
      expect(page).to have_content('test-group')
    end
    it 'Has a group Icon' do
      expect(page).to have_css("img[src='https://placehold.co/100x100']")
    end
    it 'Has a group total' do
      expect(page).to have_content('$30.0')
    end
    it 'Redirects to the add group page when the add group button is clicked' do
      click_button 'Add Group'
      expect(page).to have_current_path(new_group_product_path(@test_group))
    end
  end
end
