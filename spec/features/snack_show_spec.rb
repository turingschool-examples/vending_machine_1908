require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a snack show page' do
    before(:each) do
      @owner_1 = Owner.create(name: "Bob G")
      @machine_1 = @owner_1.machines.create(location: "Turing Basement")
      @machine_2 = @owner_1.machines.create(location: "Union Station")
      @snack_1 = Snack.create(name: "Hot Cheetos", price: 1.50)
      @snack_2 = Snack.create(name: "Takis", price: 1.20)
      @snack_3 = Snack.create(name: "Snickers", price: 1.00)
      MachineSnack.create(machine_id: @machine_1.id, snack_id: @snack_1.id)
      MachineSnack.create(machine_id: @machine_1.id, snack_id: @snack_2.id)
      MachineSnack.create(machine_id: @machine_2.id, snack_id: @snack_3.id)
      MachineSnack.create(machine_id: @machine_2.id, snack_id: @snack_1.id)
    end

    it "I see the name and price of the item" do
      visit "/snacks/#{@snack_1.id}"

      expect(page).to have_content("Hot Cheetos")
      expect(page).to have_content("$1.50")
    end

    it "I see the locations of each machine containing that snack" do
      visit "/snacks/#{@snack_1.id}"

      expect(page).to have_content("Turing Basement")
      expect(page).to have_content("Union Station")
    end

    xit "Under each location I see the average price of the machine" do

    end

    xit "Under each location I see the count of items in that machine" do

    end
  end
end
