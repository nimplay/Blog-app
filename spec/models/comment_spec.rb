require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject = Comment.new(authorId: 1, postId: 3, text: 'Hello')

  it 'Author ID need to be 1' do
    expect(subject.authorId).to be(1)
  end
  it 'Post ID need to be 3' do
    expect(subject.postId).to be(3)
  end
  it 'Text need to be Hello' do
    expect(subject.text).to eq('Hello')
  end
end
