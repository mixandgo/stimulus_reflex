class PostsController < ApplicationController
  include CableReady::Broadcaster

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    current_user.posts << @post
    cable_ready["posts"].insert_adjacent_html(
      selector: "#posts",
      position: "afterbegin",
      html: render_to_string("posts/_post", locals: { post: @post })
    )
    cable_ready.broadcast
    redirect_to root_path
  end

  private

    def post_params
      params.require(:post).permit(:body, :file)
    end
end
