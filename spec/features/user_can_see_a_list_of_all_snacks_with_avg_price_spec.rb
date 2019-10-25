require 'rails_helper'

RSpec.describe "As a User" do
  describe "when I visit a vending machine show page" do

    before :each do
      @owner = Owner.create!(name: "Sam's Snacks")
      @dons  = @owner.machines.create!(location: "Don's Sweet Delights")
      @delight = @dons.snacks.create!(name: "Dandy Don's Delight", price: 4.00)
      @chocoblaster = @dons.snacks.create!(name: "Chocoblaster", price: 2.00)
    end

    it "can see a list of all snacks in a vending machine" do

      visit machine_path(@dons)

      expect(page).to have_content(@delight.name)
      expect(page).to have_content(@chocoblaster.name)
    end
  end
end