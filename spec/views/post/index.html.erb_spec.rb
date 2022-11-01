require 'rails_helper'

RSpec.describe 'post_path', type: :feature do
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

  before(:each) do
    visit "/users/#{@first_user.id}/posts"
  end

  it 'I can see the users profile picture.' do
    expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  it 'I can see the users username.' do
    expect(page).to have_content('Tom')
  end

  it 'I can see the number of posts the user has written.' do
    expect(page).to have_content('Number posts: 4')
  end

  it 'I can see a posts title.' do
    expect(page).to have_content('Hello', count: 4)
  end

  it 'I can see some of the posts body.' do
    expect(page).to have_content('This is my first post')
  end

  it 'I can see the first comments on a post.' do
    @first_comment = Comment.create(postId: @third_post.id, authorId: @first_user.id,
                                    text: 'This is my first comment')
    visit "/users/#{@first_user.id}/posts/#{@third_post.id}"
    expect(page).to have_content(@first_comment.text)
  end

  it 'I can see how many comments a post has.' do
    @first_comment = Comment.create(postId: @third_post.id, authorId: @first_user.id,
                                    text: 'This is my first comment')
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content('💬 1')
  end

  it 'I can see how many likes a post has.' do
    @first_like = Like.create(postId: @third_post.id, authorId: @first_user.id)
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content('❤ 1')
  end

  it 'I can see a section for pagination if there are more posts than fit on the view.' do
    expect(page).to have_button('Paginations')
  end

  it 'When I click on a post, it redirects me to that posts show page.' do
    click_link(@second_post.text.to_s)
    expect(page).to have_content("post # #{@second_post.id} by #{@first_user.name}")
  end
end
