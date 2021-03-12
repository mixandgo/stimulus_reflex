require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to have_many(:likes) }
  it { is_expected.to have_many(:comments) }

  describe "#like!" do
    it "creates a like record" do
      user = create(:user)
      post = create(:post, user_id: user.id)

      expect do
        post.like!(user)
      end.to change { post.likes.count }.from(0).to(1)
    end
  end

  describe "#unlike!" do
    it "removes the like record" do
      user = create(:user)
      post = create(:post, user_id: user.id)
      post.like!(user)

      expect do
        post.unlike!(user)
      end.to change { post.likes.count }.from(1).to(0)
    end
  end

  describe "#liked?" do
    it "returns true if the user liked the post" do
      user = create(:user)
      post = create(:post, user_id: user.id)
      post.like!(user)
      expect(post.liked?(user)).to eq(true)
    end

    it "returns false if the user did not like the post" do
      user = create(:user)
      post = create(:post, user_id: user.id)

      user2 = create(:user)
      post.like!(user2)
      expect(post.liked?(user)).to eq(false)
    end
  end

  describe "#likes" do
    it "returns the number of likes" do
      user = create(:user)
      liked_post = create(:post, user_id: user.id)
      unliked_post = create(:post, user_id: user.id)
      Like.create!(post_id: liked_post.id, user_id: user.id)

      expect(liked_post.likes.count).to eq(1)
      expect(unliked_post.likes.count).to eq(0)
    end
  end
end
