Rails.application.routes.draw do
  devise_for :users
  devise_for :users, skip: :all

  get 'shopping_list/:recipe_id', to: 'recipes#shopping_list'
  get 'public_recipes', to: 'recipes#public'
  get 'recipe_foods/:recipe_id', to: 'recipe_foods#new'
  post 'recipe_foods/:recipe_id', to: 'recipe_foods#create'
  resources :recipe_foods, only: [:destroy, :update, :edit]
  resources :public_recipes, only: [:index, :show]
  resources :recipes, except: [:update, :edit]
  resources :recipe_foods
  resources :foods, except: [:edit, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "public_recipes#index"
  
end
