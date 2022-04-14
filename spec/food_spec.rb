require 'rails_helper'

RSpec.describe 'Food page', type: :feature do
  before :each do
    @user1 = User.new(name: 'Mre', email: 'mre@gmail.com', password: '123456')
    @user1.save
    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
    visit root_path
  end

  it 'should be able to see Foods' do
    expect(page).to have_content('Public Recipes')
  end

  it 'should be able to redirect to add food route' do
    click_link 'My foods'
    expect(page).to have_current_path(foods_path)
  end

  it 'should be able to see save food' do
    visit new_food_path
    fill_in 'Name', with: 'Pizza'
    fill_in 'Measurement unit', with: 'grams'
    fill_in 'Price', with: '10'
    click_button 'Add food'
    expect(page).to have_content('Pizza')
  end
end
