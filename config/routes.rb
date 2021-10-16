Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  root to: "pages#index"

  resources :products, only: %i[index show] do
    member do
      post :add_to_cart
    end
  end

  resources :carts, only: %i[show] do
    member do
      post :one_more_product
      delete :one_less_product
    end
  end
end
