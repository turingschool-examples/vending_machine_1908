require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it 'can see all snacks with prices' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    nuts = dons.snacks.create!(name: 'Organic Mixed Nuts', price: 10)
    chips = dons.snacks.create!(name: 'Biff\'s Chips', price: 8)

    visit machine_path(dons)

    within "#snacks-#{nuts.id}" do
      expect(page).to have_content(nuts.name)
      expect(page).to have_content(nuts.price)
    end

    within "#snacks-#{chips.id}" do
      expect(page).to have_content(chips.name)
      expect(page).to have_content(chips.price)
    end
  end
end
