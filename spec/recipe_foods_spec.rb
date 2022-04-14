require 'rails_helper'

RSpec.describe 'Recipe Food page', type: :feature do
  before :each do
    @user1 = User.new(name: 'William', email: 'william@gmail.com', password: '123456')
    @user1.save
    @user2 = User.new(name: 'Mre', email: 'mre@gmail.com', password: '123456')
    @user2.save!
    @food1 = Food.new(name: 'Apple', measurement_unit: 'grams', price: '10', user_id: @user1.id)
    @food1.save!
    @food2 = Food.new(name: 'Banana', measurement_unit: 'grams', price: '20', user_id: @user1.id)
    @food2.save!
    @recipe1 = Recipe.new(name: 'Hamburguer', user_id: @user1.id)
    @recipe1.save!
    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
    visit recipe_path(@recipe1.id)
  end

  it 'should be able to see Recipes' do
    expect(page).to have_content('Add ingredient')
  end

  it 'should be able to redirect to add recipe route' do
    click_link 'Add ingredient'
    expect(page).to have_current_path(recipe_food_path(@recipe1.id))
  end

  it 'should be able to see save recipe and click on the recently recipe and enter to recipe details' do
    click_link 'Add ingredient'
    select 'Apple', from: 'Food'
    fill_in 'Quantity', with: 60
    click_button 'Add Ingredient'
    expect(page).to have_content('Apple')
  end
end
