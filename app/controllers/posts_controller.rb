class PostsController < ApplicationController
  include UpvoteConcern

  def index
    @from = params[:from].to_i || 0
    @posts = Post.limit(10).offset(@from)
    @end = Post.count <= @from + 10
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    redirect_to '/login' unless logged_in?
    @post = Post.new
  end

  def create
    redirect_to '/login' unless logged_in?
    @post = Post.new(post_params)
    @post.user_id = @user.id
    if @post.save
      redirect_to @post, notice: 'Post_created', error: nil
    else
      flash[:error] = @post.errors.messages
      render :new
    end
  end

  def save
    redirect_to '/login' unless logged_in?
    save = @user.saves.find_by_post_id(params[:id])
    msg = ''
    if save.nil?
      Save.create(user_id: @user.id, post_id: params[:id])
      msg = 'Saved'
    else
      save.destroy
      msg = 'UnSaved'
    end
    redirect_back fallback_location: '/', notice: msg
  end

  def upvote
    redirect_to '/login' unless logged_in?
    upvote_item(params[:id], Post.name)
    redirect_back fallback_location: '/'
  end

  def fresh
    @from = params[:from].to_i || 0
    @posts = Post.order(created_at: :desc).limit(10).offset(@from)
    @end = Post.count <= @from + 10
    render 'index'
  end

  def top
    @from = params[:from].to_i || 0
    @posts = Post.order(score: :desc).limit(10).offset(@from)
    @end = Post.count <= @from + 10
    render 'index'
  end

  def saved
    @from = params[:from].to_i || 0
    @posts = @user.saved_posts.limit(10).offset(@from)
    @end = @user.saved_posts.count <= @from + 10
    render 'index'
  end

  def destroy
    post = Post.find(params[:id])
    return unless owns? post
    post.destroy
    redirect_to '/', notice: 'Post deleted'
  end

  def update
    post = Post.find(params[:id])
    return unless owns? post
    if post.update(post_params)
      redirect_back fallback_location: '/', notice: 'Post Updated'
    else
      flash[:error] = post.errors.messages
      redirect_back fallback_location: '/'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :body)
  end
end
