require 'rails_helper'

RSpec.describe 'Posts', type: :request do

  describe 'GET /index' do
    it 'Response status is 200' do
      get user_posts_path(1)
      expect(response).to have_http_status(200)
    end

    it 'returns http success' do
      get '/users/1/posts'
      expect(response).to have_http_status(:ok)
    end
    it 'Renders the index view template' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    it 'Rendered view includes correct placeholder text' do
      get user_posts_path(1)
      expect(response.body).to include('Blogapp')
    end
  end
end
