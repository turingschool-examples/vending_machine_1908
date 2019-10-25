# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.

require 'rails_helper'

RSpec.describe 'Snack Show Page' do
  describe 'as a visitor' do
    it 'I see the name, price, and locations of the snack' do
      owner = Owner.create!(name: "Sam's Snacks")
      dons = owner.machines.create(location: "Don's Mixed Drinks")
      julias = owner.machines.create(location: "Julia's Cantina")

      burger = dons.snacks.create!(name: "White Castle Burger", price: 3.50)
      rocks = dons.snacks.create!(name: "Pop Rocks", price: 1.50)
      cheetos = dons.snacks.create!(name: "Flaming Hot Cheetos:", price: 2.50)
      rocks = julias.snacks.create!(name: "Pop Rocks", price: 1.50)
      cheetos = julias.snacks.create!(name: "Flaming Hot Cheetos:", price: 2.50)

      visit "/snacks/#{rocks.id}"

      expect(page).to have_content(rocks.name)
      expect(page).to have_content("Price: #{rocks.price}")
      expect(page).to have_content(dons.location)
      expect(page).to have_content(julias.location)
    end
  end
end
