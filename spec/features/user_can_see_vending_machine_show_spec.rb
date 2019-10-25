require 'rails_helper'

describe 'On the Vending Machine Show Page' do
  describe 'As a User' do
    it 'lets me see all the items for that machine and their prices' do
      user = User.create(name: 'Jo', email: 'jo@jo.com', role: 0)
      sam = Owner.create(name: "Sam's Snacks")
      machine = sam.machines.create(location: "Turing Basement")
      snack1 = machine.snacks.create(name: 'Twix', price: 1.50)
      snack2 = machine.snacks.create(name: 'Chips', price: 2.0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit machine_path(machine)

      expect(page).to have_content(snack1.name)
      expect(page).to have_content("$#{snack1.price.round(2)}")
      expect(page).to have_content(snack2.name)
      expect(page).to have_content("$#{snack2.price.round(2)}")
      average_price = machine.average_snack_price
      expect(page).to_not have_content("Average Price of Snacks: $#{average_price.round(2)}")

    end
  end

  describe 'As a visitor' do
    it 'shows me the snacks name and price for the machine
        and an average price for all snacks' do
      sam = Owner.create(name: "Sam's Snacks")
      machine = sam.machines.create(location: "Turing Basement")
      snack1 = machine.snacks.create(name: 'Twix', price: 1.50)
      snack2 = machine.snacks.create(name: 'Chips', price: 2.0)
      snack3 = machine.snacks.create(name: 'Doughnuts', price: 2.5)

      visit machine_path(machine)
      expect(page).to have_content(snack1.name)
      expect(page).to have_content("$#{snack1.price.round(2)}")
      expect(page).to have_content(snack2.name)
      expect(page).to have_content("$#{snack2.price.round(2)}")
      expect(page).to have_content(snack3.name)
      expect(page).to have_content("$#{snack3.price.round(2)}")

      average_price = machine.average_snack_price
      expect(page).to have_content("Average Price of Snacks: $#{average_price.round(2)}")
    end
  end
end

# As a visitor
# When I visit a vending machine show page
# I also see an average price for all of the snacks in that machine
