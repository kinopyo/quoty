Quoty::Application.routes.draw do
  # sessions
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/auth/failure', to: 'sessions#failure'
  match '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy'

  get 'about', to: 'pages#about'

  match '/language/:language', to: 'quotes#language', language: /[a-z]+/, as: :language
  resources :quotes do
    post 'vote', to: 'votes#vote'

    resources :comments, only: [:new, :create]
  end
  resources :wikis, path: 'wiki'

  resources :users, only: [:show, :edit, :update] do
    resources :activities, only: [:index]
  end
  resources :bookmarks, only: [:create, :destroy]

  resources :identities, only: [:new]

  root to: 'quotes#index'
end
