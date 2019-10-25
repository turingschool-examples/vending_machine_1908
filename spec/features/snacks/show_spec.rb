require 'rails_helper'

RSpec.describe 'Snack show page', type: :feature do
  it 'can show name and price of snack' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    nuts = dons.snacks.create!(name: 'Organic Mixed Nuts', price: 10)
    chips = dons.snacks.create!(name: 'Biff\'s Chips', price: 8)

    visit "/snacks/#{nuts.id}"

    expect(page).to have_content(nuts.name)
    expect(page).to have_content(nuts.price)
    expect(page).to_not have_content(chips.name)
  end

  it 'can show a list of vending machines that carry snack' do
    owner = Owner.create(name: "Sam's Snacks")
    dons = owner.machines.create(location: "Don's Mixed Drinks")
    rogers = owner.machines.create(location: "Roger's Plenty 'O Snacks")
    nuts = Snack.create!(name: 'Organic Mixed Nuts', price: 10)
    MachineSnack.create!(snack_id: nuts.id, machine_id: dons.id)
    MachineSnack.create!(snack_id: nuts.id, machine_id: rogers.id)

    visit "/snacks/#{nuts.id}"

    within "#locations-#{dons.id}" do
      expect(page).to have_content('Don\'s Mixed Drinks')
    end

    within "#locations-#{rogers.id}" do
      expect(page).to have_content('Roger\'s Plenty \'O Snacks')
    end
  end

  xit 'can show average price of snacks in each vending machine' do
  end

  xit 'can show a count of different snacks in each vending machine' do
  end
end

# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.
