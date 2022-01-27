# frozen_string_literal: true

# Service to download ftp files from the serve
class AddCommentsCountToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :comments_counter, :integer
  end
end
