Rails.application.routes.draw do
  get 'home/index'

  resources :products, only: [:index, :new, :create, :show, :edit, :update]
  resources :brews, only: [:index, :new, :create, :show, :edit, :update]
  resources :sales, only: [:index, :new, :create, :show, :edit, :update]

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
