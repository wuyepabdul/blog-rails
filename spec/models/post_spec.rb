require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validates' do
    subject { Post.new title: 'Post 1', likes_counter: 0, comments_counter: 0 }

    before { subject.save }

    it 'should have a valid title' do
      expect(subject.title).to eq 'Post 1'
    end

    it 'should have an invalid title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'should have a postive integer counter value' do
      expect(subject.likes_counter).to eq 0
    end
  end
end
