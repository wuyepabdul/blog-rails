Rails.application.routes.draw do
  devise_for :users
  get 'likes/create'
  get 'comments/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    resources :users, only:[:index, :show] do
      resources :posts, only:[:index, :show, :destroy]
    end

    resources :posts, only:[:new, :create] do
      resources :comments, only:[:create, :destroy]
      resources :likes, only:[:create]
    end
  root "users#index"
end
