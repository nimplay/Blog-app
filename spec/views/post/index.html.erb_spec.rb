require 'rails_helper'

RSpec.describe 'User post index page', type: :feature do

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

  it 'I can see the users profile picture.' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  it 'I can see the users username.' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content('Tom')
  end

  it 'I can see the number of posts the user has written.' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content('Number posts: 4')
  end

end