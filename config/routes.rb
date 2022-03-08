Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations', 
    sessions: 'users/sessions'
  }
  
  root to: "pages#index"

  resources :products, only: %i[index show] do
    member do
      post :add_to_cart
    end
  end

  resources :carts, only: %i[show] do
    member do
      post :increase_product
      delete :reduce_product
      delete :remove_product
      patch :order
    end
  end

  namespace :admin do
    resources :carts, only: %i[index destroy]
  end
end
