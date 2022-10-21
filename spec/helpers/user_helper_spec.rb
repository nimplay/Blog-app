require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UserHelper. For example:
#
# describe UserHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UserHelper, type: :helper do
  it 'should return the correct user path' do
    expect(user_path(1)).to eq('/users/1')
  end
  it 'should return the correct user path' do
    expect(root_path).to eq('/')
  end
  it 'should return the correct user path' do
    expect(new_user_path).to eq('/users/new')
  end
  it 'should return the correct user path' do
    expect(user_posts_path(1)).to eq('/users/1/posts')
  end
end
