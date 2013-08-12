require 'api_constraints'

Quoty::Application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :quotes, only: [:index, :show, :language]
    end
  end
  # sessions
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get '/auth/failure', to: 'sessions#failure'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  get 'about', to: 'pages#about'

  get '/language/:language', to: 'quotes#language', language: /[a-z]+/, as: :language
  resources :quotes do
    post 'like', to: 'likes#like'
    collection do
      get :popular
      get :my
      get :likes
    end

    resources :comments, only: [:new, :create]
  end
  resources :wikis, path: 'wiki' do
    get :search, on: :collection
  end

  resources :users, only: [:show, :edit, :update] do
    resources :activities, only: [:index]
  end
  resources :authors, only: [:show] do
    get :search, on: :collection
  end
  resources :bookmarks, only: [:create, :destroy]

  resources :identities, only: [:new]
  resources :reset_passwords, only: [:new, :create, :edit, :update]

  root to: 'quotes#index'
end
