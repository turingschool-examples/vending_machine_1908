require 'rails_helper'

describe 'As a User on the Vending Machine Show Page' do
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
  end
end

# As a user
# When I visit a vending machine show page
# I see the name of all of the snacks associated
# with that vending machine along with their price
