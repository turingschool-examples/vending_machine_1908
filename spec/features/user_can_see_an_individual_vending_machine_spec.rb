require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see all the snacks from that machine, their price, and the average snack price.' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    cheetos = Snack.create(name: "Cheetos", price: 4)
    chips = Snack.create(name: "BBQ Potato Chips", price: 5)
    granola = Snack.create(name: "Healthy Wood Chips", price: 15)
    dons.machine_snacks.create(machine_id: dons.id, snack_id: cheetos.id)
    dons.machine_snacks.create(machine_id: dons.id, snack_id: chips.id)
    dons.machine_snacks.create(machine_id: dons.id, snack_id: granola.id)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("Cheetos: $3")
    expect(page).to have_content("BBQ Potato Chips: $5")
    expect(page).to have_content("Healthy Wood Chips: $15")
    expect(page).to have_content("Average Price: $8")
  end
end
