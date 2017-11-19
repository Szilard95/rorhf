module ApplicationHelper
  def logged_in?
    session[:user]
  end

  def admin?
    logged_in? && @user.account_type == 'admin'
  end

  def owns?(item)
    logged_in? && item.user_id == @user.id
  end
end
