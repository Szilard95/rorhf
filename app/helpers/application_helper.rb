module ApplicationHelper
  def logged_in?
    session[:user]
  end

  def admin?
    logged_in? && @user.account_type == 'admin'
  end
end
