Rails.application.routes.draw do
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "foods#index"
end
