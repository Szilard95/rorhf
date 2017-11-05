class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.karma = 0
    if @user.save
      session[:user] = @user.id
      flash[:notice] = 'Successful_registration'
      redirect_to '/'
    else
      flash[:notice] = @user.errors.messages
      redirect_back fallback_location: '/'
    end
  end

  def edit

  end

  def show
    @user = User.find(params[:id])
  end

  def forgotten
    redirect_back fallback_location: '/'
  end

  def update
    @user.update(user_params)
    redirect_back fallback_location: '/'
  end

  def destroy
    redirect_back fallback_location: '/'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email, :about)
  end
end
