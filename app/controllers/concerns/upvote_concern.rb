module UpvoteConcern
  extend ActiveSupport::Concern

  def upvote_item(item_id, item_type)
    upvote = @user.upvotes.where(item_id: item_id, item_type: item_type).take
    if upvote.nil?
      Upvote.create(user_id: @user.id, item_id: item_id, item_type: item_type)
    else
      upvote.destroy
    end
  end
end