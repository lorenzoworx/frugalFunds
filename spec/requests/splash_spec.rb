require 'rails_helper'

RSpec.describe 'Splash', type: :request do
  describe 'GET /index' do
    it 'Returns http success' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
