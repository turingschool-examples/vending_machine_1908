require "rails_helper"

RSpec.describe "When a visitor visits a snack show page" do
    before(:each) do
      owner_1 = Owner.create(name: "Jeff")
      machine_1 = Machine.create(location: "Turing",
                                 owner_id: 1)
      machine_2 = Machine.create(location: "Bank",
                                 owner_id: 1)
      machine_3 = Machine.create(location: "Sandwhich Shop",
                                 owner_id: 1)

      snack_1 = Snack.create(name: "Chips",
                            price: 2,
                            )
      snack_2 = Snack.create(name: "Granola Bar",
                            price: 2,
                            )
      snack_3 = Snack.create(name: "Jerky",
                            price: 5,
                            )
      snack_4 = Snack.create(name: "Gummy Bears",
                            price: 2,
                            )
      machine_snacks = MachineSnack.create(machine_id: machine_1.id,
                                          snack_id: snack_1.id)
      machine_snacks_2 = MachineSnack.create(machine_id: machine_2.id,
                                          snack_id: snack_1.id)
      machine_snacks_3 = MachineSnack.create(machine_id: machine_1.id,
                                          snack_id: snack_3.id)
      machine_snacks_4 = MachineSnack.create(machine_id: machine_2.id,
                                          snack_id: snack_4.id)

      visit "/snacks/#{snack_1.id}"
  end

  it "can see name of snack" do
    expect(page).to have_content("Chips")
  end

  it "can see price of snack" do
    expect(page).to have_content("Price: 2")
  end

  it "can see list of locations of snack" do
    expect(page).to have_content("Turing")
    expect(page).to have_content("Bank")
  end

  it "can see average_price of all snacks in machine" do
    expect(page).to have_content("Average Price: 3.5")
  end

  it "can see count of each snack in machine" do
    expect(page).to have_content("Count: 4")
  end
end
