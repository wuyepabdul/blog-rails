class LikesController < ApplicationController
  load_and_authorize_resource

  def create
    post = Post.find(params[:post_id])
    like = post.likes.new(author: current_user)

    if like.save
      redirect_to user_post_path(post.author.id, post.id), notice: 'Liked!'
    else
      redirect_to user_post_path(post.author.id, post.id), alert: 'Failed!'
    end
  end
end
