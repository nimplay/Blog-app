require 'rails_helper'

RSpec.describe 'user_path', type: :system do
  describe 'user show page' do

    it 'shows the user photo' do
      visit user_path(User.first)
      expect(page).to have_css("img[src*='#{User.first.photo}']")
    end
    it 'shows the user username' do
      visit user_path(User.first)
      expect(page).to have_content('Tom')
    end
    it 'shows the user bio' do
      visit user_path(User.first)
      expect(page).to have_content('Teacher from Mexico.')
    end
    it 'shows the user number of posts' do
      visit user_path(User.first)
      expect(page).to have_content('Number posts: 51')
    end

    it 'shows the user first 3 posts' do
      visit user_path(1)
    end

    it 'shows the user button to view all posts' do
      visit user_path(1)
      expect(page).to have_button('See all posts')
    end
  end
end
