Quoty::Application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/auth/failure', to: 'sessions#failure'
  match '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy'

  match '/language/:language', to: 'quotes#language', language: /[a-z]+/, as: :language
  resources :quotes
  resources :users
  resources :bookmarks, only: [:create, :destroy]

  resources :identities, only: [:new]

  root to: 'quotes#index'
end
