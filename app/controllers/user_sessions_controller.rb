class UserSessionsController < ApplicationController

  before_action :require_sign_out, only: :new
  before_action :require_sign_in, only: :destroy

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session.delete(:intended_url) || root_url
    else
      flash.now[:alert] = "Invalid email/password combination."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_session_url
  end
end
