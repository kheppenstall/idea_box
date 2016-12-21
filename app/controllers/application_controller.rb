class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_admin?
  before_action :require_login

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      flash[:danger] = "Login required to access page."
      redirect_to login_path
    end
  end

   
  def current_admin?
    current_user && current_user.admin?
  end
end