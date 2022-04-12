Rails.application.routes.draw do
  devise_for :users
  devise_for :users, skip: :all

  resources :public_recipes, only: [:index, :show]
  resources :recipes, except: [:update, :edit]
  resources :foods, except: [:edit, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "public_recipes#index"
  
end
