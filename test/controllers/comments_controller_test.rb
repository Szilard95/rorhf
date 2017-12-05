require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "upvote" do
    post '/login',
         params: {name: users(:me).name, password: 'a'},
         headers: {"HTTP_REFERER" => '/'}
    assert_equal session[:user], users(:me).id

    p = Post.find(1)
    score_before = p.score
    get "/posts/#{p.id}/upvote"

    p = Post.find(1)
    assert p.score == score_before + 1, "#{score_before} vs act: #{p.score}"
  end
end
