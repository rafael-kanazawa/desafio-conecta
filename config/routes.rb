Rails.application.routes.draw do
  resources :stock_transactions, only: [:index, :show, :delete]
  resources :products do 
    resources :stocks, only: :update
  end
  resources :users
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
