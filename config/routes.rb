Quoty::Application.routes.draw do
  resources :quotes
  root to: 'quotes#index'
end
