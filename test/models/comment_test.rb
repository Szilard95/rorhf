require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "empty body" do
    c = Comment.new
    c.user = users(:me)
    c.post = posts(:post_1)
    assert !c.save
  end
end
