class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.karma = 0
    if @user.save
      session[:user] = @user.id
      flash[:notice] = 'Successful_registration'
      redirect_to '/'
    else
      flash[:error] = @user.errors.messages
      redirect_back fallback_location: '/'
    end
  end

  def edit
    redirect_to '/login' unless logged_in?

  end

  def show
    @other_user = User.find(params[:id])
  end

  def forgotten
    redirect_back fallback_location: '/'
  end

  def update
    redirect_to '/login' unless logged_in?
    @user.update(user_params)
    redirect_back fallback_location: '/'
  end

  def destroy
    redirect_to '/login' unless logged_in?
    if admin?
      user = User.find(params[:id])
      user.destroy
    else
      @user.destroy
      session[:user] = nil
    end
    redirect_to '/', notice: 'User deleted'
  end

  def clear_comments
    return unless admin?
    Comment.where(user_id: params[:id]).each {|comment| comment.body = '[deleted]'; comment.save}
    redirect_back fallback_location: '/', notice: 'Comments deleted'
  end

  def clear_posts
    return unless admin?
    Post.where(user_id: params[:id]).each {|post| post.destroy}
    redirect_back fallback_location: '/', notice: 'Posts deleted'
  end

  def ban
    return unless admin?
    user = User.find(params[:id])
    user.banned = !user.banned
    user.save
    redirect_back fallback_location: '/', notice: 'User ' + (user.banned ? 'banned' : 'unbanned')
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email, :about)
  end
end
