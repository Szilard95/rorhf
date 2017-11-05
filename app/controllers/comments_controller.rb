class CommentsController < ApplicationController

  include UpvoteConcern

  def new
    @comment = Comment.new
  end

  def create
    redirect_back fallback_location: '/'
  end

  def upvote
    upvote_item(params[:id], Comment.name)
    redirect_back fallback_location: '/'
  end

  def destroy

  end
end
