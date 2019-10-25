require 'rails_helper'

describe 'On the Snack Show Page' do
  describe 'As a visitor' do
    it 'I see lots of information about that snack' do
      sam = Owner.create(name: "Sam's Snacks")
      machine1 = sam.machines.create(location: "Turing Basement")
      machine2 = sam.machines.create(location: "Train Station")
      snack1 = machine1.snacks.create(name: 'Twix', price: 1.50)
      machine2.snacks << snack1
      snack2 = machine1.snacks.create(name: 'Chips', price: 2.0)

      snack3 = machine2.snacks.create(name: 'Doughnuts', price: 2.5)


      visit snack_path(snack1)
      expect(page).to have_content(snack1.name)
      expect(page).to have_content("$#{snack1.price.round(2)}")

      within "#machine-#{machine1.id}" do
        expect(page).to have_content("Turing Basement")
        expect(page).to have_content("Average Snack Price: $1.75")
        expect(page).to have_content("Snack Count: 2")
      end

      within "#machine-#{machine2.id}" do
        expect(page).to have_content("Train Station")
        expect(page).to have_content("Average Snack Price: $2.00")
        expect(page).to have_content("Snack Count: 2")
      end
    end
  end
end
