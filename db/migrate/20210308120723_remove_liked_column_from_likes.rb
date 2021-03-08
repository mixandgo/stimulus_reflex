class RemoveLikedColumnFromLikes < ActiveRecord::Migration[6.1]
  def change
    remove_column :likes, :liked
  end
end
