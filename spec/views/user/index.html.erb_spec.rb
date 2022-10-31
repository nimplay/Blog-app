require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'test' do
    before(:each) do
      @user = User.first
      visit root_path
    end

    it 'shows user name' do
      expect(page).to have_content(@user.name)
    end

    it 'shows the Blog app title' do
      expect(page).to have_content('Blog app')
    end

    it 'shows the user photo' do
      expect(page).to have_css("img[src*='https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.wellstar.org%2Fphysicians%2Fdavid-caras-md&psig=AOvVaw3Whn9UOK1sgPz5cfMUByK2&ust=1667333274436000&source=images&cd=vfe&ved=0CA0QjRxqFwoTCPDj8c6ii_sCFQAAAAAdAAAAABAF']")
    end

    it 'shows the user name' do
      expect(page.body).to include('Tom')
    end

    it 'shows number of posts user has written' do
      expect(page.body).to include('Number posts: 0')
    end

    it 'shows number of posts user has written' do
      expect(page.body).to include('Number posts: 0')
    end
    it 'redirects to that user post when clicked' do
    end
  end
end
