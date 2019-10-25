require "rails_helper"

RSpec.describe "When a user visits a vending machine show page" do
  it "can see a name of all the snacks for that machine" do
    owner_1 = Owner.create(name: "Jeff")
    machine_1 = Machine.create(location: "Turing",
                               owner_id: 1)

    snack_1 = Snack.create(name: "Chips",
                          price: 2,
                          )
    snack_2 = Snack.create(name: "Granola Bar",
                          price: 2,
                          )
    machine_snacks = MachineSnack.create(machine_id: machine_1.id,
                                        snack_id: snack_1.id)
    machine_snacks_2 = MachineSnack.create(machine_id: machine_1.id,
                                        snack_id: snack_2.id)

    visit "/machines/#{machine_1.id}"
    expect(page).to have_content("Chips")
    expect(page).to have_content("Granola Bar")
    expect(page).to have_content("2")
  end

end
