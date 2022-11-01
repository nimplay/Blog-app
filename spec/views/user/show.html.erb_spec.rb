require 'rails_helper'

RSpec.describe 'user_path', type: :system do
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
  describe 'user show page' do
    before do
      @user = User.first
    end
    it 'shows the user photo' do
      visit user_path(@user)
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end
    it 'shows the user username' do
      visit user_path(@user)
      expect(page).to have_content('Tom')
    end
    it 'shows the user bio' do
      visit user_path(@user)
      expect(page).to have_content('Teacher from Mexico.')
    end
    it 'shows the user number of posts' do
      visit user_path(@user)
      expect(page).to have_content('Number posts: 4')
    end

    it 'shows the user first 3 posts' do
      visit user_path(@user.id)
      expect(page.body).to include('Hello')
      expect(page.body).to include('Hello')
      expect(page.body).to include('Hello')
    end
  end
end
