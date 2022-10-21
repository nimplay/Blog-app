require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'photo', bio: 'Teacher from Mexico.', postCounter: 0) }

  it 'should be valid' do
    expect(subject).to be_valid
  end
  it 'should be no valid' do
    subject.name = ''
    expect(subject).to_not be_valid
  end
  it 'should not allow name shorter than 3 characters' do
    subject.name = 'abch'
    expect(subject).to be_valid
    subject.name = 'ab'
    expect(subject).to_not be_valid
  end
end
