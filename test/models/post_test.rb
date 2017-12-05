require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "empty everything" do
    p = Post.new
    assert !p.save
  end
  test "empty url and body" do
    p = Post.new
    p.title = 'TestPost'
    assert !p.save
  end
  test "empty body" do
    p = Post.new
    p.title = 'TestPost'
    p.url = 'https://example.com/test'
    p.user = users(:me)
    assert p.save
  end
end
