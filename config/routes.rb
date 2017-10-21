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
  resources :users

  root 'posts#index'
end
