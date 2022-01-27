# frozen_string_literal: true

# Service to download ftp files from the serve
class AddPostCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :posts_counter, :integer
  end
end
