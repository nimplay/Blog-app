require 'rails_helper'

RSpec.describe Like, type: :model do
  subject = Like.new(authorId: 1, postId: 3)

  it 'Author ID need to be 1' do
    expect(subject.authorId).to be(1)
  end
  it 'Post ID need to be 3' do
    expect(subject.postId).to be(3)
  end
end
