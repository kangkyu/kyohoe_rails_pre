class UserSessionsController < ApplicationController
  def new
  end

  def create
    session[:user_id] = User.first.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
  end
end
