Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  root to: "pages#index"

  resources :products, only: %i[index]
  resources :carts, only: %i[show]
end
