# frozen_string_literal: true

# Service to download ftp files from the serve
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio

      t.timestamps
    end
  end
end
