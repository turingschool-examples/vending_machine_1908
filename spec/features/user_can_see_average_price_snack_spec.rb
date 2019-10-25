require "rails_helper"

RSpec.describe "When a user visits a vending machine show page" do
  it "can see an average price for all snacks in machine" do
    owner_1 = Owner.create(name: "Jeff")
    machine_1 = Machine.create(location: "Turing",
                               owner_id: 1)

    snack_1 = Snack.create(name: "Chips",
                          price: 2,
                          )
    snack_2 = Snack.create(name: "Mountain Bar",
                          price: 4,
                          )
    machine_snacks = MachineSnack.create(machine_id: machine_1.id,
                                        snack_id: snack_1.id)
    machine_snacks_2 = MachineSnack.create(machine_id: machine_1.id,
                                        snack_id: snack_2.id)

    visit "/machines/#{machine_1.id}"
    expect(page).to have_content("Chips")
    expect(page).to have_content(2)
    expect(page).to have_content("Mountain Bar")
    expect(page).to have_content(4)
    expect(page).to have_content("Average Price: 3")
  end

end
