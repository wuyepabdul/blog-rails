class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @users = User.all.order('created_at Desc')
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts
  end
end
