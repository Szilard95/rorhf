class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = @user.id
    @post.save
    redirect_to '/'
  end

  def save
    save = @user.saves.find_by_post_id(params[:id])
    if save.nil?
      Save.create(user_id: @user.id, post_id: params[:id])
    else
      save.destroy
    end
    redirect_back fallback_location: '/'
  end

  def upvote
    upvote = @user.upvotes.find_by_post_id(params[:id])
    if upvote.nil?
      Upvote.create(user_id: @user.id, post_id: params[:id])
    else
      upvote.destroy
    end
    redirect_back fallback_location: '/'
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :body)
  end
end
