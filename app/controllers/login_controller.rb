class LoginController < ApplicationController
  def index

  end

  def login
    @user = User.authenticate(params[:name], params[:password])
    if @user
      session[:user] = @user.id
      redirect_to '/'
    else
      flash[:notice] = 'Invalid_user_name_or_password'
      redirect_back fallback_location: '/'
    end
  end

  def logout
    reset_session
    flash[:notice] = 'Logged_out_successfully'
    redirect_to '/'
  end
end
