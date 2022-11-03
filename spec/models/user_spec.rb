require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.first }
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
  def admin?
    role == 'admin'
  end
end
