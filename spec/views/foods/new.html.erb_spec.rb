require 'rails_helper'

RSpec.describe 'foods/new', type: :view do
  before(:each) do
    assign(:food, Food.new)
  end
end
