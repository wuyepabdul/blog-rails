class RemoveCommentFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :comments_counter, :integer
  end
end
