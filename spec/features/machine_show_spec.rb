require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the machine show page' do
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

    it "I see the name and price of every snack in the machine" do
      visit "/machines/#{@machine_1.id}"

      expect(page).to have_content("Turing Basement")

      within "#snack-#{@snack_1.id}" do
        expect(page).to have_content("Hot Cheetos")
      end

      within "#snack-#{@snack_2.id}" do
        expect(page).to have_content("Takis")
      end

      expect(page).to_not have_content("Snickers")
      

      visit "/machines/#{@machine_2.id}"

      expect(page).to have_content("Union Station")

      within "#snack-#{@snack_1.id}" do
        expect(page).to have_content("Hot Cheetos")
      end

      within "#snack-#{@snack_3.id}" do
        expect(page).to have_content("Snickers")
      end
      expect(page).to_not have_content("Takis")
    end

    xit "I see the average price of all snacks in the machine" do

    end
  end
end
