require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  before :each do
    @test_user = User.create(name: 'John', email: 'admin@test.com', password: 'test12')
    sign_in @test_user
  end

  describe 'GET/index' do
    it 'Returns http success' do
      get '/groups'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    it 'Returns http success' do
      Group.create(author: @test_user, name: 'test-group', icon: 'https://placehold.co/100x100')
      get group_path(Group.last)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST :create' do
    it 'Creates a new group' do
      test_group = { name: 'Test group', icon: 'https://placehold.co/100x100' }

      post '/groups', params: { group: test_group }
      expect(response).to have_http_status(302)
      expect(Group.first.name).to eq('test-group')
    end
  end
end
