Rails.application.routes.draw do
  get 'login', to: 'login#index'
  post 'login', to: 'login#login'
  get 'logout', to: 'login#logout'

  resources :posts do
    member do
      get 'save'
      get 'upvote'
      post 'comment', to: 'comments#create'
    end
  end
  resources :comments do
    member do
      get 'upvote'
      post 'reply'
    end
  end

  resources :users do
    member do
      get 'ban'
      get 'clear_posts'
      get 'clear_comments'
    end
  end

  get 'fresh', to: 'posts#fresh'
  get 'top', to: 'posts#top'
  get 'saved', to: 'posts#saved'

  root 'posts#index'
end
