class ApplicationController < ActionController::Base
  def require_sign_in
    unless signed_in?
      session[:intended_url] = request.url
      redirect_to sign_in_url, notice: "Not logged in"
    end
  end

  def require_sign_out
    if signed_in?
      redirect_to session.delete(:intended_url) || root_url, notice: "Already logged in"
    end
  end

  def current_user_id
    session[:user_id]
  end

  def signed_in?
    current_user_id.present?
  end

  def current_user
    @current_user ||= current_user_id && User.find(current_user_id)
  end

  # def require_admin
  #   if !admin_user?
  #     redirect_to root_url, notice: "admin only"
  #   end
  # end

  # def admin_user?
  #   signed_in? && current_user.admin?
  # end

  helper_method :signed_in?
  helper_method :current_user
  # helper_method :admin_user?
end
