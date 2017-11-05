class Upvote < ApplicationRecord
  after_create :add_karma
  before_destroy :subtract_karma
  belongs_to :user
  belongs_to :item, polymorphic: true


  def subtract_karma
    update_scores(-1)
  end

  def add_karma
    update_scores(1)
  end

  def update_scores(val)
    item.user.karma += val
    item.user.save
    item.score += val
    item.save
  end
end
