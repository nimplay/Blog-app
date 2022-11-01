require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
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
  describe 'test' do
    before(:each) do
      @user = User.first
      visit root_path
    end

    it 'shows user name' do
      expect(page).to have_content(@user.name)
    end

    it 'shows the Blog app title' do
      expect(page).to have_content('Blog app')
    end

    it 'shows the user photo' do
      expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'shows the user name' do
      expect(page.body).to include('Tom')
    end

    it 'shows number of posts user has written' do
      expect(page.body).to include('Number posts: 4')
    end

    it 'shows number of posts user has written' do
      expect(page.body).to include('Number posts: 4')
    end
    it 'redirects to that user post when clicked' do
    end
  end
end
