class Post < ApplicationRecord
  has_one_attached :file
  has_many :likes
  has_many :comments

  def like!(user)
    likes << Like.new(user: user)
  end

  def unlike!(user)
    likes.where(user_id: user.id).destroy_all
  end

  def liked?(user)
    likes.where(user_id: user.id).any?
  end
end
