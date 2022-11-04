require 'rails_helper'

RSpec.describe 'Api::V1::Posts', type: :request do
  describe 'GET /api/v1/posts' do
    it 'works! (now write some real specs)' do
      get api_v1_posts_path
      expect(response).to have_http_status(200)
    end
  end
end
