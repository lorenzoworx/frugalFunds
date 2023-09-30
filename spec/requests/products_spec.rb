require 'rails_helper'

RSpec.describe 'Products', type: :request do
  before :each do
    @test_user = User.create(name: 'John', email: 'admin@test.com', password: 'test12')
    @test_group = Group.create(author: @test_user, name: 'test-group', icon: 'https://placehold.co/100x100')
    sign_in @test_user
  end

  describe 'GET /new' do
    it 'returns a http success' do
      get new_group_product_path(@group)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST :crreate' do
    it 'Creates a new Product' do
      test_product = { name: 'test-group', amount: 30 }
      post group_products_path(@group), params: { product: test_product }
      expect(response).to have_http_status(302)
      expect(Product.first.name).to eq('test-group')
      expect(Product.first.amount).to eq(30.0)
    end
  end
end
