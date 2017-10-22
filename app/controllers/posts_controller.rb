class PostsController < ApplicationController
  def index
    @posts = []

    10.times do |i|
      post = Post.new(id: i, title: "Post ##{i}", url: 'https://example.com',
                      score: rand(100), created_at: Time.now, user: @user)
      @posts.push(post)
    end
  end

  def show
    @post = Post.new(id: 1, title: 'Random Post', body: 'Lorem ipsum dolor sit amet', user: @user,
                     score: rand(100), created_at: Time.now)

    comments = []
    comments.push(Comment.new(id: 1, post: @post, user: @user, body: 'comment #1', score: rand(100),
                              created_at: Time.now))
    comments.push(Comment.new(id: 2, post: @post, user: @user, body: 'comment #2', score: rand(100),
                              created_at: Time.now))
    comments.push(Comment.new(id: 3, post: @post, user: @user, body: 'comment #3', score: rand(100),
                              created_at: Time.now))
    comments.push(Comment.new(id: 4, post: @post, user: @user, body: 'subcomment #4 for #1', score: rand(100),
                              created_at: Time.now, parent_id: 1))
    comments.push(Comment.new(id: 5, post: @post, user: @user, body: 'subcomment #5 for #4', score: rand(100),
                              created_at: Time.now, parent_id: 4))
    comments.push(Comment.new(id: 6, post: @post, user: @user, body: 'subcomment #6 for #3', score: rand(100),
                              created_at: Time.now, parent_id: 3))
    rand(15).times do |i|
      parent = 1 + rand(comments.size)
      comments.push(Comment.new(id: 6 + i + 1, post: @post, user: @user, body: "subcomment ##{6 + i + 1} for ##{parent}", score: rand(100),
                                created_at: Time.now, parent_id: parent))
    end
    @post.comments = comments
  end

  def new
    @post = Post.new
  end

  def create
  end

  def save
    redirect_back fallback_location: '/'
  end

  def upvote
    redirect_back fallback_location: '/'
  end
end
