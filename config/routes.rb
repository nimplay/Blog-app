Rails.application.routes.draw do

  root 'users#index'
  get 'users/new', to: 'users#new', as: :new_user
  get 'users/:id', to: 'users#show', as: :user
  get 'users/:id/posts', to: 'posts#index', as: :user_posts
end
