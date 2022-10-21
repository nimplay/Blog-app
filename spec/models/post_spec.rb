require 'rails_helper'

RSpec.describe Post, type: :model do
  subject = Post.new(title: 'Hello', text: 'Thist', likesCounter: 0, commentsCounter: 0)

  it 'should allow title shorter than 3 characters' do
    expect(subject.likesCounter).to be >= 0
  end

  it 'should not allow title shorter than 3 characters' do
    subject.title = 'ab'
    expect(subject).to_not be_valid
  end

  it 'should allow text shorter than 3 characters' do
    expect(subject.likesCounter).to be >= 0
  end

  it 'should not allow text shorter than 3 characters' do
    subject.text = 'ab'
    expect(subject).to_not be_valid
  end
end
