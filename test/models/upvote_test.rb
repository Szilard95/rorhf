require 'test_helper'

class UpvoteTest < ActiveSupport::TestCase
  test "add karma" do
    score_before = posts(:post_1).score
    u = Upvote.new
    u.user = users(:user_2)
    u.item = posts(:post_1)
    u.add_karma
    assert posts(:post_1).score == score_before + 1, "Score error #{posts(:post_1).score} != #{score_before + 1}"
  end
  test "subtract karma" do
    score_before = posts(:post_1).score
    u = Upvote.new
    u.user = users(:user_2)
    u.item = posts(:post_1)
    u.subtract_karma
    assert posts(:post_1).score == score_before - 1, "Score error #{posts(:post_1).score} != #{score_before + 1}"
  end
end
