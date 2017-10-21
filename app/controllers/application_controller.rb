class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  private

  def current_user
    @user = User.new
    @user.id = 1
    @user.name = 'TestUser'
    @user.karma = 42
    @user.about = 'about me'
    @user.email = 'user@example.com'
    @user.created_at = Time.now
  end
end
