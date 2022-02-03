class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250, too_long: 'Title length must not exceed 250 characters' }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def recent_comments
    comments.last(5)
  end

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
