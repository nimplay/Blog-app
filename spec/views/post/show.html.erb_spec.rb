require 'rails_helper'

RSpec.describe 'show', type: :feature do
  before(:all) do
    @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.', postCounter: 0)

    @first_post = Post.create(authorId: @first_user.id, title: 'Hello', text: 'This is my first post',
                              commentsCounter: 0, likesCounter: 0)

    @first_comment = Comment.create(postId: @first_post.id, authorId: @first_user.id,
                                    text: 'This is my first comment')
    @first_like = Like.create(postId: @first_post.id, authorId: @first_user.id)
  end

  before(:each) do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
  end

  it "I can see the post's title." do
    expect(page).to have_content(@first_post.title)
  end

  it 'I can see who wrote the post.' do
    expect(page).to have_content(@first_user.name)
  end

  it 'I can see how many comments it has.' do
    expect(page).to have_content('💬 1')
  end

  it 'I can see how many likes it has.' do
    expect(page).to have_content('1')
  end

  it 'I can see the post body.' do
    expect(page).to have_content(@first_post.text)
  end

  it 'I can see the username of each commentor.' do
    expect(page).to have_content(@first_user.name.to_s)
  end

  it 'I can see the comment each commentor left.' do
    expect(page).to have_content(@first_comment.text)
  end
end
