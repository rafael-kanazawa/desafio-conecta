Rails.application.routes.draw do
  resources :stock_transactions, only: [:index, :show, :delete]
  resources :products
  resources :users
  put '/products/:product_id/stock', to: 'stocks#update'
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
