class RecipeFoodsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new(:food_id => params[:recipe_food][:food_id], :quantity => params[:recipe_food][:quantity], :recipe_id => params[:recipe_id])

    @recipe_food.attributes.inspect

    if @recipe_food.save!
      flash[:notice] = 'Ingredient was successfully added to the recipe.'
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = 'Ingredient was not added to the recipe.'
    end
  end
end
