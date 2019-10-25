require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see the name and prices of all snacks associated with that machine' do
    owner = Owner.create!(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    burger = dons.snacks.create!(name: "White Castle Burger", price: 3.50)
    rocks = dons.snacks.create!(name: "Pop Rocks", price: 1.50)

    visit machine_path(dons)

    expect(page).to have_content(burger.name)
    expect(page).to have_content(burger.price)
    expect(page).to have_content(rocks.name)
    expect(page).to have_content(rocks.price)

    average_price = (burger.price + rocks.price)/2
    expect(page).to have_content("Average Price: $#{average_price}")
  end
end
