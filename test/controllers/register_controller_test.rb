require 'test_helper'

class RegisterControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get register_show_url
    assert_response :success
  end

end
