require 'rails_helper'

RSpec.describe 'user_path', type: :system do
  describe 'user show page' do
    before do
      @user = User.first
    end
    it 'shows the user photo' do
      visit user_path(@user)
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end
    it 'shows the user username' do
      visit user_path(@user)
      expect(page).to have_content('Tom')
    end
    it 'shows the user bio' do
      visit user_path(@user)
      expect(page).to have_content('Teacher from Mexico.')
    end
    it 'shows the user number of posts' do
      visit user_path(@user)
      expect(page).to have_content('Number posts: 51')
    end

    it 'shows the user first 3 posts' do
      visit user_path(@user.id)
      expect(page.body).to include('post3')
      expect(page.body).to include('post2')
      expect(page.body).to include('post1')
    end
  end
end
