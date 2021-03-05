class Post < ApplicationRecord
  has_one_attached :file
  has_many :user_posts
  has_many :posts, through: :user_posts

  def likes
    user_posts.where(liked: true).count
  end

  def like!(user)
    user_posts.where(user_id: user.id).update(liked: true)
  end

  def liked?(user)
    up = user_posts.where(user_id: user.id).first
    up.nil? ? false : up.liked
  end
end
