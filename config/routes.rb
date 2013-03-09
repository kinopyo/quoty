Quoty::Application.routes.draw do
  # sessions
  post '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  get 'about', to: 'pages#about'

  get '/language/:language', to: 'quotes#language', language: /[a-z]+/, as: :language
  resources :quotes do
    post 'vote', to: 'votes#vote'

    resources :comments, only: [:new, :create]
  end
  resources :wikis, path: 'wiki' do
    get :search, on: :collection
  end

  resources :users, only: [:show, :edit, :update] do
    resources :activities, only: [:index]
  end
  resources :bookmarks, only: [:create, :destroy]

  resources :identities, only: [:new]

  root to: 'quotes#index'
end
