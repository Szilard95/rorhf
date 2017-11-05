class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  private

  def current_user
    @user = User.find(session[:user]) if session[:user]
  end
end
