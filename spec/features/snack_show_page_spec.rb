require 'rails_helper'

describe 'As a visitor' do
  it 'can see snack, price locations with amount of items and avg price' do
    sam = Owner.create(name: "Sam's Snacks")
    drinks_machine = sam.machines.create(location: "Don's Mixed Drinks")
    drinks_machine_2 = sam.machines.create(location: "David's Mixed Drinks")
    dr_pepper = Snack.create(name: 'Dr. Pepper', price: 1.50)
    drinks_machine.snacks << dr_pepper
    drinks_machine_2.snacks << dr_pepper

    visit snack_path(dr_pepper)

    expect(page).to have_content("Don's Mixed Drinks(1 kinds of snacks, average price of $1.50)")

    expect(page).to have_content("David's Mixed Drinks(1 kinds of snacks, average price of $1.50)")
  end
end
