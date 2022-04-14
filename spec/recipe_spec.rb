require 'rails_helper'

RSpec.describe 'Recipe page', type: :feature do
  before :each do
    @user1 = User.new(name: 'Mre', email: 'mre@gmail.com', password: '123456')
    @user1.save
    @user2 = User.new(name: 'William', email: 'william@gmail.com', password: '123456')
    @user2.save!
    @recipe1 = Recipe.new(name: 'Hamburguer', user_id: @user1.id)
    @recipe1.save!
    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
    visit recipes_path
  end

  it 'should be able to see Recipes' do
    expect(page).to have_content('New recipe')
  end

  it 'should be able to redirect to add recipe route' do
    click_link 'New recipe'
    expect(page).to have_current_path(new_recipe_path)
  end

  it 'should be able to see save recipe and click on the recently recipe and enter to recipe details' do
    click_link 'New recipe'
    fill_in 'Name', with: 'Pizza'
    fill_in 'Description',
            with: 'Pizza is a savory dish of Italian origin.'
    fill_in 'Preparation time', with: '30'
    fill_in 'Cooking time', with: '60'
    click_button 'Add recipe'
    expect(page).to have_content('Pizza')
    click_on 'Pizza'
    expect(page).to have_content('Preparation time:')
  end
end
