class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.new(comment_params)
    @comment.session = session.id
    @comment.save
    # redirect_to @post
    # render turbo_stream: [
    #   turbo_stream.replace(
    #     "new_comment",
    #     partial: "comments/new",
    #     locals: { post: @post, comment: Comment.new }
    #   ),
    #   turbo_stream.append(
    #     "comments",
    #     partial: "comments/comment",
    #     locals: { post: @post, comment: @comment }
    #   )
    # ]
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
