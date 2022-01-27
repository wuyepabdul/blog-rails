# frozen_string_literal: true

# Service to download ftp files from the serve
class ApplicationController < ActionController::Base
  def current_user
    @user = User.first
  end
end
