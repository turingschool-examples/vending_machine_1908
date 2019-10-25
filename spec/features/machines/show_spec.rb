# frozen_string_literal: true

require 'rails_helper'

describe 'As a User', type: :feature do
  describe 'When I visit a vending machine show page' do
    before(:each) do
      @owner = Owner.create!(name: "Sam's Snacks")
      @sams  = @owner.machines.create!(location: "Sam's Candy")
      @snack = Snack.create!(name: 'Chocolate', price: 2.75)
      @snack_2 = Snack.create!(name: 'Candy Bar', price: 3.25)
      @snack_3 = Snack.create!(name: 'Caramel', price: 2.50)
      MachineSnack.create!(machine_id: @sams.id, snack_id: @snack.id)
      MachineSnack.create!(machine_id: @sams.id, snack_id: @snack_2.id)
      MachineSnack.create!(machine_id: @sams.id, snack_id: @snack_3.id)

      visit machine_path(@sams)
    end
    it 'they see the location of that machine' do
      expect(page).to have_content("Sam's Candy Vending Machine")
    end

    it 'I see the name of all of the snacks associated with that vending machine along with their price' do
      within "#snack-#{@snack.id}" do
        expect(page).to have_content('Chocolate: $2.75')
      end

      within "#snack-#{@snack_2.id}" do
        expect(page).to have_content('Candy Bar: $3.25')
      end

      within "#snack-#{@snack_3.id}" do
        expect(page).to have_content('Caramel: $2.50')
      end
    end

    it 'I also see an average price for all of the snacks in that machine' do
      expect(page).to have_content('Average Price: $2.83')
    end
  end
end
