require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it 'can see all the snacks of the machine with their price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    sal   = owner.machines.create(location: "Sal's Snacks")
    mnt   = dons.snacks.create(name: "Mnt Dew", price: 1.50)
    dorit = sal.snacks.create(name: "Doritos", price: 1.50)
    oreo  = sal.snacks.create(name: "Oreos", price: 2.50)

    visit machine_path(sal)

    within "#snack-#{dorit.id}" do
      expect(page).to have_content("Name: Doritos")
      expect(page).to have_content("Price: $1.50")
    end
    
    within "#snack-#{oreo.id}" do
      expect(page).to have_content("Name: Oreos")
      expect(page).to have_content("Price: $2.50")
    end
    
    expect(page).to_not have_css("#snack-#{mnt.id}")
  end
  
  it 'can see the average price of a machines snacks' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    sal   = owner.machines.create(location: "Sal's Snacks")
    mnt   = dons.snacks.create(name: "Mnt Dew", price: 1.50)
    dorit = sal.snacks.create(name: "Doritos", price: 1.50)
    oreo  = sal.snacks.create(name: "Oreos", price: 2.50)

    visit machine_path(sal)
    
    within '#average-snack-price' do
      expect(page).to have_content("Average Price: $2.00")
    end
  end
end
