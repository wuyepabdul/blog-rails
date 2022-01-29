require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    subject { User.new name: 'Abdul', posts_counter: 0 }

    before { subject.save }

    it 'should have a valid name' do
      expect(subject.name).to eq 'Abdul'
    end

    it 'should have an invalid name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have a postive integer posts counter' do
      expect(subject.posts_counter).to eq 0
    end
  end
end
