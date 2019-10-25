# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'methods' do
    before(:each) do
      owner = Owner.create!(name: "Sam's Snacks")
      @sams = owner.machines.create!(location: "Sam's Candy")
      snack = Snack.create!(name: 'Chocolate', price: 2.75)
      snack_2 = Snack.create!(name: 'Candy Bar', price: 3.25)
      snack_3 = Snack.create!(name: 'Caramel', price: 2.50)
      MachineSnack.create!(machine_id: @sams.id, snack_id: snack.id)
      MachineSnack.create!(machine_id: @sams.id, snack_id: snack_2.id)
      MachineSnack.create!(machine_id: @sams.id, snack_id: snack_3.id)
    end

    describe 'average_price' do
      it 'shows average price for all snacks in that machine' do
        expect(@sams.average_price.round(2)).to eq(2.83)
      end
    end

    describe 'count_of_snacks' do
      it 'shows count of snacks in a specific vending machine' do
        expect(@sams.count_of_snacks).to eq(3)
      end
    end
  end
end
