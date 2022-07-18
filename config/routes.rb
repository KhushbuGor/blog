Rails.application.routes.draw do
  get 'post/show'
  get 'post/update'
  get 'post/destroy'

  root "authors#index"
  resources :authors do
    resources :posts
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
