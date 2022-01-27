# frozen_string_literal: true

# Service to download ftp files from the serve
class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, &:timestamps
  end
end
