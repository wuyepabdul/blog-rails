# Service to download ftp files from the serve
class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def recent_posts
    @posts = Post.last(3)
  end
end
