require 'rails_helper'

describe 'On Post Index Page', type: :feature do
  before(:each) do
    visit user_session_path
    @user1 = User.create!(
      name: 'user1', bio: 'this is my bio', photo: '',
      email: 'user1@gmail.com', password: 'user1user1', confirmed_at: Time.now
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

    # Comments
    user2 = User.create!(
      name: 'user2', bio: 'this is my bio',
      photo: '', email: 'user2@gmail.com',
      password: 'user2user2', confirmed_at: Time.now
    )
    user2.comments.create!(text: 'really nice post', post: @post1)
    user2.comments.create!(text: 'Great', post: @post1)
    user2.comments.create!(text: 'fantastic', post: @post1)
    visit user_posts_path(@user1)
  end

  describe 'I can see' do
    it 'the user\'s profile picture' do
      image_src = page.find('img')['src']
      expect(image_src).to eql 'https://i.pinimg.com/originals/73/16/f5/7316f550de9ca0045e3d8d98a5bb5e44.png'
    end

    it 'the user\'s username' do
      expect(page).to have_content 'user1'
    end

    it 'see the number of posts the user has written' do
      posts = page.all('.post-comment-wrapper')
      expect(posts.length).to eql 3
      expect(page).to have_content 'Number of posts: 3'
    end

    it 'a post\'s title.' do
      expect(page).to have_content 'Cats and Dogs'
    end

    it 'some of the post\'s body.' do
      expect(page).to have_content 'this is first post about cats and dogs!'
    end

    it 'the first comments on a post.' do
      expect(page).to have_content 'really nice post'
      expect(page).to have_content 'Great'
      expect(page).to have_content 'fantastic'
    end

    it 'how many comments a post has.' do
      expect(page).to have_content 'Comments: 3'
    end

    it 'how many likes a post has.' do
      expect(page).to have_content 'Likes: 0'
    end

    it 'a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_button 'More Posts'
    end

    it 'when I click on a post, it redirects me to that post\'s show page.' do
      click_link 'Cats and Dogs'
      expect(page).to have_current_path(user_post_path(@user1, @post1))
    end
  end
end
