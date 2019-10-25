require 'rails_helper'

RSpec.describe 'When a user visits a Snacks show page', type: :feature do
  scenario 'they see the Snacks name, price, location, #of snacks at location, avg snack price at location' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    bubbas  = owner.machines.create(location: "Bubbas Shrimp")

    shrimp = Snack.create(name: "Shrimp", price: 30)
    cheetos = Snack.create(name: "Cheetos", price: 4)
    chips = Snack.create(name: "BBQ Potato Chips", price: 5)
    granola = Snack.create(name: "Healthy Wood Chips", price: 15)

    bubbas.machine_snacks.create(machine_id: bubbas.id, snack_id: shrimp.id)
    bubbas.machine_snacks.create(machine_id: bubbas.id, snack_id: cheetos.id)
    dons.machine_snacks.create(machine_id: dons.id, snack_id: cheetos.id)
    dons.machine_snacks.create(machine_id: dons.id, snack_id: chips.id)
    dons.machine_snacks.create(machine_id: dons.id, snack_id: granola.id)

    visit snack_path(cheetos.id)

    expect(page).to have_content("Cheetos")
    expect(page).to have_content("Price: $#{cheetos.price}")
    expect(page).to have_content("Locations")
    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("3 kinds of snacks, average price of $8.0")
    expect(page).to have_content("Bubbas Shrimp")
    expect(page).to have_content("2 kinds of snacks, average price of $17.0")
  end
end
