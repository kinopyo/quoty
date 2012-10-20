Quoty::Application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/auth/failure', to: redirect('/')
  match '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy'

  resources :quotes
  resources :users
  root to: 'quotes#index'
end
