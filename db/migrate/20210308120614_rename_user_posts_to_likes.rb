class RenameUserPostsToLikes < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_posts, :likes
  end
end
