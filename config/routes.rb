Rails.application.routes.draw do
  resources :posts
  get :sign_in, to: "sessions#new"
  post "sessions/create"
  delete :log_out, to: "sessions#destroy"
  resource :users, only: [:new, :create]
  root "posts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

