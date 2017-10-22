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
    (1 + rand(5)).times do |i|
      comments.push(Comment.new(id: i, post: @post, user: @user, body: "comment ##{i}", score: rand(100),
                                created_at: Time.now))
    end
    rand(15).times do |i|
      parent = rand(comments.size)
      comments.push(Comment.new(id: comments.size, post: @post, user: @user, body: "subcomment ##{comments.size} for ##{parent}", score: rand(100),
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
