class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @comments = Post.find(params[:post_id]).comments
    render json: @comments, status: :ok
  end
  
  def new
    @comments = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(text: comment_params[:text], author: current_user)

    if comment.save
      render json: { success: true }, status: :created
    else
      # render json: { success: false }, status: :bad_request
      render json: comment.errors , status: :bad_request
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])

    return unless can? :destroy, @comment

    @comment.destroy
    redirect_to user_post_path(current_user.id, post.id), notice: 'Comment deleted successfully!'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
