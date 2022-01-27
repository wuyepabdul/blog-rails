# Service to download ftp files from the serve
class Like < ApplicationRecord
  belongs_to :post, counter_cache: :likes_counter
  belongs_to :user

  def update_likes_counter
    post.likes_counter = 0 if post.likes_counter.nil?
    posts.likes_counter += 1
    posts.save
  end
end
