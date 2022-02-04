require 'rails_helper'

describe 'User Show Page', type: :feature do
  before(:each) do
    visit user_session_path
    @user1 = User.create!(
      name: 'user1', bio: 'this is my bio',
      photo: 'test_image1', email: 'user1@gmail.com',
      password: 'user1user1', confirmed_at: Time.now,
      posts_counter: 4
    )
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Password', with: 'user1user1'
    click_button 'Log in'

    @post1 = @user1.posts.create!(
      title: 'Cats and Dogs', text: 'this is first post about cats and dogs!', comments_counter: 0, likes_counter: 0
    )
    @user1.posts.create!(
      title: 'Post2', text: 'this is first post about cats and dogs!', comments_counter: 0, likes_counter: 0
    )
    @user1.posts.create!(
      title: 'Three', text: 'this is first post about cats and dogs!', comments_counter: 0, likes_counter: 0
    )
    visit user_path(@user1)
  end

  describe 'show page tests' do
    it 'can see the user\'s profile picture' do
      image_src = page.find('img')['src']
      expect(image_src).to eql 'https://i.pinimg.com/originals/73/16/f5/7316f550de9ca0045e3d8d98a5bb5e44.png'
    end

    it 'can see the user\'s username' do
      expect(page).to have_content 'user1'
    end

    it 'can see the user\'s bio' do
      visit user_path(@user1)
      expect(page).to have_content 'this is my bio'
    end

    it 'I can see the user\'s first three posts' do
      posts = page.all('.post-div')
      expect(posts.length).to eql 3
    end

    it 'When I click a user\'s post, it redirects me to that post\'s show page.' do
      click_link 'Cats and Dogs'
      expect(page).to have_current_path(user_post_path(@user1, @post1))
    end

    it 'I can see a button that lets me view all of a user\'s posts.' do
      expect(page).to have_link 'See All Posts'
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
      click_link 'See All Posts'
      expect(page).to have_current_path(user_posts_path(@user1))
    end
  end
end