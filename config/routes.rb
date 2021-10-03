Rails.application.routes.draw do
  resources :stock_transactions, only: {:index, :show, :delete}
  resources :products do 
    resources :stocks, only: :update
  end
  resources :sessions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
