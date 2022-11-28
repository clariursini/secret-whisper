Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :conversations do
    resources :messages
  end

  resources :beers
  resources :games
  resources :bars

  get 'friends', to: 'friends#index', as: 'friends'
  get 'profile', to: 'friends#show', as: 'profile'
  # get 'bar', to: 'bar#show', as: 'bar'
  get 'barcode/:id', to: 'bars#barcode', as: 'barcode'
  get 'new_post', to: 'pages#new_post', as: 'new_post'
  put 'update_post', to: 'pages#update_post', as: 'update_post'
  post "create_beer/:id", to: 'beers#create_beer', as: 'create_beer'
  delete "delete_beer/:id", to: 'beers#delete_beer', as: 'delete_beer'
end
