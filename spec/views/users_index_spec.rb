require 'rails_helper'

describe 'User Index Page', type: :feature do
  before(:each) do
    visit user_session_path
    @user = User.create!(
      name: 'user1', photo: '', email: 'user1@gmail.com',
      password: 'user1user1', confirmed_at: Time.now, posts_counter: 4
    )
    User.create!(
      name: 'user2', photo: '', email: 'user2@gmail.com',
      password: 'user2user2', confirmed_at: Time.now, posts_counter: 3
    )
    User.create!(
      name: 'user3', photo: '', email: 'user3@gmail.com',
      password: 'user3user3', confirmed_at: Time.now, posts_counter: 1
    )
    fill_in 'Email', with: 'user2@gmail.com'
    fill_in 'Password', with: 'user2user2'
    click_button 'Log in'
    visit users_path
  end

  describe 'index page' do
    it 'it should display all users' do
      expect(page).to have_content('user2')
      expect(page).to have_content('user1')
      expect(page).to have_content('user3')
    end

    it 'should have the correct user image' do
      imgs = page.all('img')
      expect(imgs.size).to eql 3
      # NOTE: users are rendered in the alphabetical order
      expect(imgs[0]['src']).to eql 'https://i.pinimg.com/originals/73/16/f5/7316f550de9ca0045e3d8d98a5bb5e44.png'
      expect(imgs[1]['src']).to eql 'https://i.pinimg.com/originals/73/16/f5/7316f550de9ca0045e3d8d98a5bb5e44.png'
      expect(imgs[2]['src']).to eql 'https://i.pinimg.com/originals/73/16/f5/7316f550de9ca0045e3d8d98a5bb5e44.png'
    end

    it 'should have the correct number of posts displayed' do
      num_posts = page.all('.num_posts')
      expect(num_posts[0]).to have_content 'Number of posts: 1'
      expect(num_posts[1]).to have_content 'Number of posts: 3'
      expect(num_posts[2]).to have_content 'Number of posts: 4'
    end

    it 'ensures clicking the user redirect to the users page' do
      click_link 'user1'
      expect(page).to have_current_path user_path(@user)
    end
  end
end
