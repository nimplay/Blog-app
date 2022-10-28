Rails.application.routes.draw do
  root 'users#index'
  get 'users/new', to: 'users#new', as: :new_user
  get 'users/:id', to: 'users#show', as: :user
  get 'users/:id/posts', to: 'posts#index', as: :user_posts
  get 'users/:id/posts/new', to: 'posts#new', as: :user_post_new
  get 'users/:id/posts/:post_id', to: 'posts#show', as: :post
  get 'users/:id/posts/:post_id/comment/new', to: 'comments#new', as: :comment
  post 'users/:id/posts/create', to: 'posts#create', as: :posts_create
  post 'users/:id/posts/:post_id/comment/create', to: 'comments#create', as: :comment_create
  post 'users/:id/posts/:post_id/create/like', to: 'likes#create', as: 'like_create'
end
