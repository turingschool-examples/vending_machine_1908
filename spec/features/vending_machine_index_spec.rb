require 'rails_helper'

describe 'As a Visitor' do
  it ' can see the name of all of the snacks for vm with their price' do
    sam = Owner.create(name: "Sam's Snacks")
    drinks_machine = sam.machines.create(location: "Don's Mixed Drinks")
    dr_pepper = drinks_machine.snacks.create(name: 'Dr. Pepper', price: 1.50)
    mtn_dew = drinks_machine.snacks.create(name: 'Mountain Dew', price: 1.75)

    visit machine_path(drinks_machine)

    expect(page).to have_content("#{dr_pepper.name}: $#{dr_pepper.price}")
    expect(page).to have_content("#{mtn_dew.name}: $#{mtn_dew.price}")
  end
end
