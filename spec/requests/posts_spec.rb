require 'rails_helper'

RSpec.describe 'Posts', type: :request do
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
