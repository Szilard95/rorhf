class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    redirect_back fallback_location: '/'
  end

  def upvote
    redirect_back fallback_location: '/'
  end

  def destroy

  end
end
