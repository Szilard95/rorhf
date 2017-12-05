require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "ban user_1" do
    post '/login',
         params: {name: users(:me).name, password: 'a'},
         headers: {"HTTP_REFERER" => '/'}
    assert_equal session[:user], users(:me).id

    get '/users/1/ban'
    assert users(:user_1).banned
  end

end
