# frozen_string_literal: true

# Service to download ftp files from the serve
class AddLikesCountToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :likes_counter, :integer
  end
end
