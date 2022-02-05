require 'rails_helper'

describe 'In Post Show Page', type: :feature do
  before(:each) do
    visit user_session_path
    @user1 = User.create!(
      name: 'user1', bio: 'this is my bio', photo: 'test_image1',
      email: 'user1@gmail.com', password: 'user1user1', confirmed_at: Time.now
    )
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Password', with: 'user1user1'
    click_button 'Log in'
    post = @user1.posts.create!(
      title: 'Cats and Dogs', text: 'this is first post about cats and dogs!',
      comments_counter: 0, likes_counter: 0
    )
    user2 = User.create!(
      name: 'user2', bio: 'this is my bio',
      photo: 'test_image1', email: 'user2@gmail.com',
      password: 'user2user2', confirmed_at: Time.now
    )
    user2.comments.create!(text: 'really nice post Michael', post: post)
    user2.comments.create!(text: 'Great', post: post)
    user2.comments.create!(text: 'fantastic', post: post)
    visit user_post_path(@user1, post)
  end
  describe 'I can see' do
    it 'a post\'s title.' do
      expect(page).to have_content 'Cats and Dogs'
    end
    it 'who wrote the post.' do
      expect(page).to have_content 'user1'
    end
    it 'how many comments it has.' do
      expect(page).to have_content 'Comments: 3'
    end
    it 'how many likes it has.' do
      expect(page).to have_content 'Likes: 0'
    end
    it 'the post body.' do
      expect(page).to have_content 'this is first post about cats and dogs!'
    end
    it 'the username of each commentor.' do
      expect(page).to have_content 'user2'
    end
    it 'the comment each commentor left.' do
      expect(page).to have_content 'really nice post Michael'
      expect(page).to have_content 'Great'
      expect(page).to have_content 'fantastic'
    end
  end
end
