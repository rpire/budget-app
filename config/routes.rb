Rails.application.routes.draw do
  devise_for :users
  
  root 'splash#index'

  resources :groups, only: [:index, :new, :show, :create]
  resources :entities, only: [:new, :show, :create]

  get 'completed', to: 'entities#completed'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
