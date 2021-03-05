require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to have_many(:user_posts) }
  it { is_expected.to have_many(:posts).through(:user_posts) }

  describe "#like!" do
    it "creates a recrod in the db" do
      post = create(:post)
      user = create(:user)
      UserPost.create!(liked: false, post_id: post.id, user_id: user.id)

      expect do
        post.like!(user)
      end.to change { post.likes }.from(0).to(1)
    end
  end

  describe "#liked?" do
    it "returns true if the user liked the post" do
      post = create(:post)
      user = create(:user)
      user.posts << post
      post.like!(user)
      expect(post.liked?(user)).to eq(true)
    end

    it "returns false if the user did not like the post" do
      post = create(:post)
      user = create(:user)
      user.posts << post
      expect(post.liked?(user)).to eq(false)
    end

    context "when there are not records" do
      it "returns false" do
        post = create(:post)
        user = create(:user)
        expect(post.liked?(user)).to eq(false)
      end
    end
  end

  describe "#likes" do
    it "returns the number of likes" do
      user = create(:user)
      liked_post = create(:post)
      unliked_post = create(:post)
      UserPost.create!(liked: true, post_id: liked_post.id, user_id: user.id)
      UserPost.create!(liked: false, post_id: unliked_post.id, user_id: user.id)

      expect(liked_post.likes).to eq(1)
      expect(unliked_post.likes).to eq(0)
    end
  end
end
