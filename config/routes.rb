Rails.application.routes.draw do
  post 'posts/update/:id', to: 'posts#update'
  get 'posts/new', to: 'posts#new'
  get 'posts/:id', to: 'posts#show', constraints: { id: /\d+/ }
  get 'posts/:topic', to: 'posts#posts_by_topic'
  
  resources :posts

  root to: 'posts#index'
end
