class Post < ApplicationRecord
  has_one_attached :file
  has_many :likes

  def like!(user)
    likes << Like.new(user: user)
  end

  def liked?(user)
    likes.where(user_id: user.id).any?
  end
end
