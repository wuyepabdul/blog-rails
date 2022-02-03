class CommentsController < ApplicationController
  def new
    @comments = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(text: comment_params[:text], author: current_user)

    respond_to do |format|
      format.html do
        if comment.save

          redirect_to user_post_path(post.author.id, post.id), notice: 'Comment added!'
        else
          flash.now[:error] = 'Faild to send comment!'
          redirect_to user_post_path(post.author.id, post.id), alert: 'Failed to add comment!'
        end
      end
    end
  end

  # def destroy
  #   @comment = Comment.find(params[:id])
  #   if can? :destroy, @comment
  #     @comment.destroy
  #     # redirect_to user_posts_path(current_user.id), notice: 'Comment deleted successfully!'
  #   end
  # end

  private

  def comment_params
    params.require(:data).permit(:text)
  end
end
