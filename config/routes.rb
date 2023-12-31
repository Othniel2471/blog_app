Rails.application.routes.draw do
  # get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[new create]
      resources :likes, only: %i[create]
    end
  end
end
