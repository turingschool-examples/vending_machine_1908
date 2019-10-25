require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when I visit a snack show page' do
    before :each do
      owner = Owner.create(name: "Sam's Snacks")
      @sal   = owner.machines.create(location: "Sal's Snacks")
      dorit = @sal.snacks.create(name: "Doritos", price: 1.50)
      oreo  = @sal.snacks.create(name: "Oreos", price: 3.00)

      @dons  = owner.machines.create(location: "Don's Food and Drink")
      mnt    = @dons.snacks.create(name: "Mnt Dew", price: 1.50)
      @dons.snacks << oreo
      @dons.snacks << dorit

      @none = owner.machines.create(location: "I have nothing")

      visit snack_path(oreo)
    end
    
    it 'displays the name and price' do
      within '#item-info' do
        expect(page).to have_content("Name: Oreos")
        expect(page).to have_content("Price: $3.00")
      end
    end

    it 'displays all the locations the item is sold at with the number of items and average price' do
      within "#machine-#{@dons.id}" do
        expect(page).to have_content("Don's Food and Drink (3 kinds of snacks, average price of $2.00)")
      end

      within "#machine-#{@sal.id}" do
        expect(page).to have_content("Sal's Snacks (2 kinds of snacks, average price of $2.25)")
      end

      expect(page).to_not have_css("#machine-#{@none.id}")
    end

  end
end
