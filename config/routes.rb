Rails.application.routes.draw do
  post 'posts/update/:id', to: 'posts#update'
  resources :posts

  root to: 'posts#index'
end
