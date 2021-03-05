class DefaultFalseForLikedFlag < ActiveRecord::Migration[6.1]
  def change
    change_column :user_posts, :liked, :boolean, default: false, null: false
  end
end
