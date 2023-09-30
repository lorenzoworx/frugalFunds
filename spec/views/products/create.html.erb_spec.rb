require 'rails_helper'

RSpec.describe 'Product/create', type: :system do
  describe 'Create product`` page' do
    before do
      @test_user = User.create(name: 'John', email: 'admin@test.com', password: 'test12')
      @test_group = Group.create(author: @test_user, name: 'test-group', icon: 'https://placehold.co/100x100')

      visit new_group_product_path(@test_group)
      fill_in 'Email', with: @test_user.email
      fill_in 'Password', with: @utest_user.password
      click_button 'Log in'

      fill_in 'Name', with: 'test-product'
      fill_in 'Amount', with: 30
      select @test_group.name, from: 'product_group_ids'
      click_button 'Add Transaction'
    end
    it 'Has a product name' do
      expect(page).to have_content('test-product')
    end
    it 'Has a product amount' do
      expect(page).to have_content('$30.0')
    end
  end
end
