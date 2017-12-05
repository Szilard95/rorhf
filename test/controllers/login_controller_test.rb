require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get '/login'
    assert_response :success
  end
  test "login" do
    post '/login',
         params: {name: users(:me).name, password: 'a'},
         headers: {"HTTP_REFERER" => '/'}
    assert_response :redirect
    assert_equal session[:user], users(:me).id
  end
  test "logout" do
    post '/login',
         params: {name: users(:me).name, password: 'a'},
         headers: {"HTTP_REFERER" => '/'}
    assert_equal session[:user], users(:me).id
    get '/logout',
        headers: {"HTTP_REFERER" => '/'}
    assert_response :redirect
    assert_nil session[:user]
  end

end
