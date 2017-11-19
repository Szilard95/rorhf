class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def logged_in?
    session[:user]
  end

  def admin?
    logged_in? && @user.account_type == 'admin'
  end

  def owns?(item)
    logged_in? && item.user_id == @user.id
  end

  private

  def current_user
    @user = User.find(session[:user]) if session[:user]
  end
end
