require 'rails_helper'

# As a user
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price

RSpec.describe 'vending machine show page', type: :feature do

  before :each do
    @owner  = Owner.create(name: "Sam's Snacks")
    @dons   = @owner.machines.create(location: "Don's Mixed Drinks")
    @wilmas = @owner.machines.create(location: "Wilma's Diner")

    @burger    = @dons.snacks.create(name: 'White Castle Burger', price: 3.50)
    @pop_rocks = @dons.snacks.create(name: 'Pop Rocks', price: 1.50)
    @cheetos   = @dons.snacks.create(name: 'Flaming Hot Cheetos', price: 2.00)

    @snickers = @wilmas.snacks.create(name: 'Snickers Bar', price: 1.50)
  end

  it 'can see the location of the machine' do
    visit machine_path(@dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it 'can see the names and prices of all snacks in the machine' do
    visit machine_path(@dons)

    within "#snack-#{@burger.id}" do
      expect(page).to have_content('White Castle Burger')
      expect(page).to have_content('Price: $3.50')
    end

    within "#snack-#{@pop_rocks.id}" do
      expect(page).to have_content('Pop Rocks')
      expect(page).to have_content('Price: $1.50')
    end

    within "#snack-#{@cheetos.id}" do
      expect(page).to have_content('Flaming Hot Cheetos')
      expect(page).to have_content('Price: $2.00')
    end
    save_and_open_page
  end

  it 'cannot see the names and prices of snacks in other machines' do
    visit machine_path(@dons)

    expect(page).to_not have_css("#snack-#{@snickers.id}")
  end

end
