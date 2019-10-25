require 'rails_helper'

RSpec.describe 'Machine Show page' do
  before(:each) do
    @owner = Owner.create(name: "Jeff")
    @machine_1 = Machine.create(location: "Turing", owner_id: @owner.id )
    @machine_1.snacks.create(name: "Perfect Bars", price: 6 )
    @machine_1.snacks.create(name: "Cheez-its", price: 2 )
  end

  describe "When I visit a vending machine show page" do
    it "I see the name and price of all of the snacks associated with that machine" do
      visit machine_path(@machine_1)

      @snack_1 = @machine_1.snacks.first
      @snack_2 = @machine_1.snacks.last

      within("#snack-#{@snack_1.id}") do
        expect(page).to have_content(@snack_1.name)
        expect(page).to have_content(@snack_1.price)
      end

      within("#snack-#{@snack_2.id}") do
        expect(page).to have_content(@snack_2.name)
        expect(page).to have_content(@snack_2.price)
      end
    end

    it "I can see the average price of all snacks" do
      visit machine_path(@machine_1)

      expect(page).to have_content("Average price of snacks: $4.00")
    end
  end
end