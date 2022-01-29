class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.recent_posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      redirect_to user_post_path(post.author.id, post.id), notice: 'Published successfully!'
    else
      flash.now[:alert] = 'Failed to publish post!'
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
