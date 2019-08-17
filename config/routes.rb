Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'genres#index'
  resources :users,   only: [:index, :edit, :update]
  resources :genres , only: [:index, :show]
  resources :stores , only: [:index, :new, :create, :show]
  resources :details , only: [:index, :create]
  
end
