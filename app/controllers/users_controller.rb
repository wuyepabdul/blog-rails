class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at Desc')
  end

  def show; end
end
