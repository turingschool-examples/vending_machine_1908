require 'rails_helper'

describe 'On the Snack Show Page' do
  describe 'As a visitor' do
    it 'I see lots of information about that snack' do
      sam = Owner.create(name: "Sam's Snacks")
      machine = sam.machines.create(location: "Turing Basement")
      machine2 = sam.machines.create(location: "Train Station")
      snack1 = machine.snacks.create(name: 'Twix', price: 1.50)
      snack1 = machine2.snacks.create(name: 'Twix', price: 1.50)
      snack2 = machine.snacks.create(name: 'Chips', price: 2.0)
      snack3 = machine2.snacks.create(name: 'Doughnuts', price: 2.5)


      visit snack_path(snack1)
      expect(page).to have_content(snack1.name)
      expect(page).to have_content("$#{snack1.price.round(2)}")

      expect(page).to have_content("Locations")
    end
  end
end

# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.
