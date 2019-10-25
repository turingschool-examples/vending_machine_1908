require 'rails_helper'

RSpec.describe "As a User" do
  describe "when I visit a snack show page" do

    before :each do
      @owner = Owner.create!(name: "Sam's Snacks")
      @dons  = @owner.machines.create!(location: "Don's Sweet Delights")
      @courts  = @owner.machines.create!(location: "Courtney's Coffee Counter")
      @delight = @dons.snacks.create!(name: "Dandy Don's Delight", price: 4.00)
      @delight = @courts.snacks.create!(name: "Dandy Don's Delight", price: 4.00)
      @chocoblaster = @dons.snacks.create!(name: "Chocoblaster", price: 2.00)
    end

    it "can see the name of the snack, price, list of locations that carry that snack, avg item price for those machines, and count of different items" do

      visit snack_path(@delight)

      expect(page).to have_content(@delight.name)
      expect(page).to have_content(@delight.price)

      within "#vendor-#{@dons.id}" do
        expect(page).to have_content(@dons.name)
        expect(page).to have_content('Average item price: $3.0')
        expect(page).to have_content('Item count: 2')
      end

      within "#vendor-#{@courts.id}" do
        expect(page).to have_content(@courts.name)
        expect(page).to have_content('Average item price: $3.0')
        expect(page).to have_content('Item count: 2')
      end

    end
  end
end


# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.