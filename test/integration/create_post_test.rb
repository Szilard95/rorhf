require 'test_helper'

class CreatePostTest < ActionDispatch::IntegrationTest
  setup do
    @new_post = Post.new
    @new_post.title = 'NewTestPost'
    @new_post.body = 'Test Post Text'
    @new_comment = Comment.new
    @new_comment.body = 'This is a comment'
  end

  test "create new post and comment" do
    get '/'
    assert_response :success
    assert_select 'li', 'login'

    post '/login',
         params: {name: users(:me).name, password: 'a'},
         headers: {"HTTP_REFERER" => '/'}
    assert_response :redirect
    assert_equal session[:user], users(:me).id

    get '/'
    assert_response :success
    assert_select 'li', 'submit'

    post '/posts',
         params: {'post[title]' => @new_post.title, 'post[body]' => @new_post.body},
         headers: {"HTTP_REFERER" => '/posts/new'}
    assert_response :redirect
    p = Post.find_by_title(@new_post.title)
    assert p.user_id == session[:user]

    get "/posts/#{p.id}"
    assert_response :success
    assert_select 'input'

    post "/posts/#{p.id}/comment",
         params: {'body' => @new_comment.body},
         headers: {"HTTP_REFERER" => "/posts/#{p.id}"}
    assert_response :redirect
    get "/posts/#{p.id}"
    assert_select 'div', 'Comment created'
    assert Comment.find_by_body(@new_comment.body)
  end
end
