require 'rails_helper'

describe Snack, type: :model do

  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :price}
  end

  describe "relationships" do
    it {should belong_to :machine}
  end

  describe 'methods' do
    it 'returns a list of all machine locations for a snack' do
      sam = Owner.create(name: "Sam's Snacks")
      machine = sam.machines.create(location: "Turing Basement")
      machine2 = sam.machines.create(location: "Train Station")
      machine3 = sam.machines.create(location: "Campus Rec Room")

      snack1 = machine.snacks.create(name: 'Twix', price: 1.50)
      snack1 = machine2.snacks.create(name: 'Twix', price: 1.50)

      snack3 = machine3.snacks.create(name: 'Dont show', price: 500.0)

      expect(snack1.locations).to eq(['Turing Basement', 'Train station'])
    end
  end
end
