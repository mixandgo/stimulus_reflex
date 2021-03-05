class LikesController < ApplicationController
  def create
    @post = Post.find(params.require(:id))
    @post.like!(current_user)
    redirect_to root_path
  end
end
