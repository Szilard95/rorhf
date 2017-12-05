require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user without anything" do
    u = User.new
    assert !u.save
  end
  test "user unique name" do
    u = User.new
    u.name = users(:me).name
    u.password = 'a'
    assert !u.save
  end
end
