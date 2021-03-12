class CommentsController < ApplicationController
  include CableReady::Broadcaster

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = find_post.id
    @comment.save
    cable_ready["posts"].append(
      selector: "#instacard-post-#{find_post.id} .instacard-comments",
      html: render_to_string("comments/_comment", layout: false, locals: { comment: @comment })
    )
    cable_ready.broadcast

    redirect_to root_path
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_post
      @find_post ||= Post.find(params.require(:id))
    end
end
