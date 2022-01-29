require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_counter' do
    let(:user) { User.create(name: 'Paul', posts_counter: 0) }
    let(:post) { user.posts.create(title: 'Post', comments_counter: 0, likes_counter: 0) }

    it 'Should update the post counter' do
      post.comments.create(author: user)
      expect(post.comments_counter).to eq 1
      expect(post.title).to eq 'Post'
    end
  end
end
