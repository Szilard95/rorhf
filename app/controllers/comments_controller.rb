class CommentsController < ApplicationController

  include UpvoteConcern

  def new
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:id])
    comment = Comment.new(post: post, user: @user, body: params[:body], score: 0)
    if comment.save
      redirect_back fallback_location: '/', notice: 'Comment created'
    else
      flash[:error] = comment.errors.messages
      redirect_back fallback_location: '/'
    end
  end

  def upvote
    upvote_item(params[:id], Comment.name)
    redirect_back fallback_location: '/'
  end

  def reply
    comment = Comment.find(params[:id])
    reply = Comment.new(post: comment.post, user: @user, body: params[:body], parent_id: comment.id)
    if reply.save
      redirect_back fallback_location: '/', notice: 'Reply created'
    else
      flash[:error] = reply.errors.messages
      redirect_back fallback_location: '/'
    end
  end

  def update
    comment = Comment.find(params[:id])
    return unless admin? || owns?(comment)
    if comment.update(comment_params)
      redirect_back fallback_location: '/', notice: 'Comment Updated'
    else
      flash[:error] = comment.errors.messages
      redirect_back fallback_location: '/'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    return unless admin? || owns?(comment)
    comment.body = '[deleted]'
    comment.save
    redirect_back fallback_location: '/', notice: 'Comment deleted'
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
