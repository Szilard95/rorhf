require 'test_helper'

class SaveTest < ActiveSupport::TestCase
  test "saving" do
    s = Save.new
    s.user = users(:me)
    s.post = posts(:post_1)
    assert s.save
  end
end
