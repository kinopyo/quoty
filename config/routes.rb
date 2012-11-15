Quoty::Application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/auth/failure', to: redirect('/')
  match '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy'

  match '/language/:language', to: 'quotes#language', language: /[a-z]+/, as: :language
  resources :quotes

  root to: 'quotes#index'

  resources :users, path: ''
end
