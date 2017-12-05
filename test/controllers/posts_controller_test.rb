require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get posts_path
    assert_response :success
  end

  test "create" do
    post '/login',
         params: {name: users(:me).name, password: 'a'},
         headers: {"HTTP_REFERER" => '/'}
    assert_equal session[:user], users(:me).id

    post '/posts',
         params: {'post[title]' => 'TestPost', 'post[body]' => 'TextBody'},
         headers: {"HTTP_REFERER" => '/'}
    assert Post.find_by_title('TestPost').user_id == session[:user]
  end

end
