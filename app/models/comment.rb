# frozen_string_literal: true

# Service to download ftp files from the serve
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :comments_counter

  def update_comments_counter
    post.comments_counter = 0 if post.comments_counter.nil?
    posts.comments_counter += 1
    posts.save
  end
end
