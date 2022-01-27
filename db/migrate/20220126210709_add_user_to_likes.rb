# frozen_string_literal: true

# Service to download ftp files from the serve
class AddUserToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :user, null: false, foreign_key: true
  end
end
