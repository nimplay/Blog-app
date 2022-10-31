require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'test' do
    before(:each) do
      @user = User.create(name: 'Nimrod', bio: 'I am Nimplay',
                          photo: 'https://icons.iconarchive.com/icons/iconsmind/outline/512/User-icon.png')
      @id = @user.id
      Post.create(author: @user, title: 'Hello', text: 'This is my first post')
      visit root_path
    end

    it 'shows user name' do
      expect(page).to have_content(@user.name)
    end

    it 'shows the Blog app title' do
      expect(page).to have_content('Blog app')

    end

    it 'shows the user photo' do
      expect(page).to have_css("img[src*='photo']")
    end

    it 'shows the user name' do
      expect(page.body).to include('Nimrod')
    end

    it 'shows number of posts user has written' do
      expect(page.body).to include('Number posts: 0')
    end

    it 'shows number of posts user has written' do
      expect(page.body).to include('Number posts: 0')
    end
  end
  it 'clicking on a card' do
  end
end
