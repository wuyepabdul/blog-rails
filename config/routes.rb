Rails.application.routes.draw do
  get 'likes/create'
  get 'comments/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    resources :users, only:[:index, :show] do
      resources :posts, only:[:index, :show]
    end

    resources :posts, only:[:new,:create] do
      resources :comments, only:[:create]
      resources :likes, only:[:create]
    end
  root "users#index"
end
