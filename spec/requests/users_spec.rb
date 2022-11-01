require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:all) do
    @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.', postCounter: 0)

    @first_post = Post.create(authorId: @first_user.id, title: 'Hello', text: 'This is my first post',
                              commentsCounter: 0, likesCounter: 0)
    @second_post = Post.create(authorId: @first_user.id, title: 'Hello', text: 'This is my second post',
                               commentsCounter: 0, likesCounter: 0)
    @third_post = Post.create(authorId: @first_user.id, title: 'Hello', text: 'This is my third post',
                              commentsCounter: 0, likesCounter: 0)
    @fourth_post = Post.create(authorId: @first_user.id, title: 'Hello', text: 'This is my fourth post',
                               commentsCounter: 0, likesCounter: 0)
  end

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
