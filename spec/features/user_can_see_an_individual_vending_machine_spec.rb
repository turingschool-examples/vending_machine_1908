require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  scenario 'they see all snacks associated with the machine and their price and average price of all snacks' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    pop_rocks = dons.snacks.create(name: 'Pop Rocks', price: 1.5)
    cheetos = dons.snacks.create(name: 'Cheetos', price: 1.0)
    snickers = dons.snacks.create(name: 'Snickers', price: 1.75)
    reeses = dons.snacks.create(name: 'Reeses', price: 1.25)

    visit machine_path(dons)

    within "#snacks-#{pop_rocks.id}" do
      expect(page).to have_content('Pop Rocks')
      expect(page).to have_content('Price: $1.5')
    end

    within "#snacks-#{cheetos.id}" do
      expect(page).to have_content('Cheetos')
      expect(page).to have_content('Price: $1.0')
    end

    within "#snacks-#{snickers.id}" do
      expect(page).to have_content('Snickers')
      expect(page).to have_content('Price: $1.75')
    end

    within "#snacks-#{reeses.id}" do
      expect(page).to have_content('Reeses')
      expect(page).to have_content('Price: $1.25')
    end

    within "#average_price" do
      expect(page).to have_content('Average Price: $1.38')
    end
  end
end
