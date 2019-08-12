Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'genres#index'
  resources :genres , only: [:index, :show]
  resources :stores , only: [:index, :new, :create, :show]
  
end
