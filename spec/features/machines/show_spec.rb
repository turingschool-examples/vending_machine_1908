require 'rails_helper'

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
      expect(page).to have_content('White Castle Burger: $3.50')
    end

    within "#snack-#{@pop_rocks.id}" do
      expect(page).to have_content('Pop Rocks: $1.50')
    end

    within "#snack-#{@cheetos.id}" do
      expect(page).to have_content('Flaming Hot Cheetos: $2.00')
    end
  end

  it 'cannot see the names and prices of snacks in other machines' do
    visit machine_path(@dons)

    expect(page).to_not have_css("#snack-#{@snickers.id}")
  end

  it 'can see the average price for all of the snacks in the machine' do
    visit machine_path(@dons)

    expect(page).to have_content('Average Price: $2.33')
  end

end
