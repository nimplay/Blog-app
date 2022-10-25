require 'rails_helper'

RSpec.describe 'Users', type: :request do
  @user1 = User.new(name: 'Tom', photo: 'photo', bio: 'Teacher from Mexico.', postCounter: 0)
  @user1.save
  
  describe 'GET /index' do
    it 'Response status is 200' do
      get root_path
      expect(response).to have_http_status(200)
    end
    it 'Renders the index view template' do
      get root_path
      expect(response).to render_template(:index)
    end

    it 'Rendered view includes correct placeholder text' do
      get root_path
      expect(response.body).to include('Blogapp')
    end
    it 'Rendered view includes correct placeholder text' do
      get root_path
      expect(response.body).to include('Tom')
    end
  end
  describe 'GET /show' do
    it 'Response status is 200' do
      get user_path(1)
      expect(response).to have_http_status(200)
    end
    it 'Renders the show view' do
      get '/users/1'
      expect(response).to render_template(:show)
    end
  end
end
