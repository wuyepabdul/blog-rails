# frozen_string_literal: true

# Service to download ftp files from the serve
class AddUserToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, null: false, foreign_key: true
  end
end
