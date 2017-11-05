class Upvote < ApplicationRecord
  after_create :add_karma
  before_destroy :subtract_karma
  belongs_to :user
  belongs_to :post


  def subtract_karma
    update_scores(-1)
  end

  def add_karma
    update_scores(1)
  end

  def update_scores(val)
    post.user.karma += val
    post.user.save
    post.score += val
    post.save
  end
end
