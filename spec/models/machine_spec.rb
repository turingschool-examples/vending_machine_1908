require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'relationships' do
    it {should have_many :machine_snacks}
    it {should have_many( :snacks ).through(:machine_snacks)}
  end

  describe 'methods' do
    it 'calculates the average price of one machines snacks' do
      sam = Owner.create(name: "Sam's Snacks")
      machine = sam.machines.create(location: "Turing Basement")
      snack1 = machine.snacks.create(name: 'Twix', price: 1.50)
      snack2 = machine.snacks.create(name: 'Chips', price: 2.0)
      snack3 = machine.snacks.create(name: 'Doughnuts', price: 2.5)

      average_price = machine.average_snack_price
      expect(average_price).to eq(2.0)
    end

    it 'returns count of items in machine' do
      sam = Owner.create(name: "Sam's Snacks")
      machine = sam.machines.create(location: "Turing Basement")
      snack1 = machine.snacks.create(name: 'Twix', price: 1.50)
      snack2 = machine.snacks.create(name: 'Chips', price: 2.0)
      snack3 = machine.snacks.create(name: 'Doughnuts', price: 2.5)
      
      expect(machine.snack_count).to eq(3)
    end
  end
end
