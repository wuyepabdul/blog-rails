class AddCommentsCountToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :comments_counter, :integer, default: 0
  end
end
