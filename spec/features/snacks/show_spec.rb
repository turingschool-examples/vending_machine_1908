# frozen_string_literal: true

require 'rails_helper'

describe 'As a visitor', type: :feature do
  describe 'When I visit a snack show page' do
    before(:each) do
      @owner = Owner.create!(name: "Sam's Snacks")
      @sams  = @owner.machines.create!(location: "Sam's Candy")
      @sams_2 = @owner.machines.create!(location: "Sam's Finest Chocolate")
      @snack = Snack.create!(name: 'Chocolate', price: 2.75)
      @snack_2 = Snack.create!(name: 'Candy Bar', price: 3.25)
      MachineSnack.create!(machine_id: @sams.id, snack_id: @snack.id)
      MachineSnack.create!(machine_id: @sams.id, snack_id: @snack_2.id)
      MachineSnack.create!(machine_id: @sams_2.id, snack_id: @snack.id)

      visit snack_path(@snack)
    end

    it 'I see the name of that snack' do
      expect(page).to have_content('Chocolate')
    end

    it 'I see the price for that snack' do
      expect(page).to have_content('Price: $2.75')
    end

    it 'I see a list of locations with vending machines that carry that snack' do
      expect(page).to have_content('Locations:')
      expect(page).to have_content("Sam's Candy")
      expect(page).to have_content("Sam's Finest Chocolate")
    end

    it 'I see the average price for snacks in those vending machines' do
      expect(page).to have_content('Average Price: $3.00')
    end

    it 'I see a count of the different kinds of items in that vending machine' do
      expect(page).to have_content('2 kinds of snacks')
    end
  end
end
