Rails.application.routes.draw do
  devise_for :users
  resources :recipes, except: [:update, :edit]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#index"
end
