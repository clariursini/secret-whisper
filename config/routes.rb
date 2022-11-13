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
  resources :bars

  get 'friends', to: 'friends#index', as: 'friends'
  get 'profile', to: 'friends#show', as: 'profile'
  # get 'bar', to: 'bar#show', as: 'bar'
  get 'barcode/:id', to: 'bar#barcode', as: 'barcode'
end
