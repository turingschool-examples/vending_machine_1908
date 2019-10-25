require 'rails_helper'

RSpec.describe 'snack show page', type: :feature do

  before :each do
    @owner  = Owner.create(name: "Sam's Snacks")
    @dons   = @owner.machines.create(location: "Don's Mixed Drinks")
    @wilmas = @owner.machines.create(location: "Wilma's Diner")
    @turing = @owner.machines.create(location: 'Turing Basement')

    @pop_rocks = Snack.create(name: 'Pop Rocks', price: 1.50)
    @burger    = Snack.create(name: 'White Castle Burger', price: 3.50)
    @cheetos   = Snack.create(name: 'Flaming Hot Cheetos', price: 2.00)

    MachineSnack.create(snack_id: @pop_rocks.id, machine_id: @dons.id)
    MachineSnack.create(snack_id: @pop_rocks.id, machine_id: @wilmas.id)
    MachineSnack.create(snack_id: @pop_rocks.id, machine_id: @turing.id)

    MachineSnack.create(snack_id: @burger.id, machine_id: @dons.id)
    MachineSnack.create(snack_id: @burger.id, machine_id: @wilmas.id)

    MachineSnack.create(snack_id: @cheetos.id, machine_id: @turing.id)
    MachineSnack.create(snack_id: @cheetos.id, machine_id: @dons.id)
  end

  it 'can see the name and price of the snack' do
    visit snack_path(@pop_rocks)

    expect(page).to have_content('Pop Rocks')
    expect(page).to have_content('Price: $1.50')
  end

  it 'can see a list of locations with count of snacks and average price' do
    visit snack_path(@pop_rocks)

    within "#location-#{@dons.id}" do
      expect(page).to have_content("Don's Mixed Drinks")
      expect(page).to have_content('(3 kinds of snacks, average price of $2.33)')
    end

    within "#location-#{@wilmas.id}" do
      expect(page).to have_content("Wilma's Diner")
      expect(page).to have_content('(2 kinds of snacks, average price of $2.50)')
    end

    within "#location-#{@turing.id}" do
      expect(page).to have_content("Turing Basement")
      expect(page).to have_content('(2 kinds of snacks, average price of $1.75)')
    end
  end

end
