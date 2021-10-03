Rails.application.routes.draw do
  resources :stock_transactions
  resources :products
  resources :stocks
  resources :sessions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
