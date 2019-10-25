require 'rails_helper'

describe Snack, type: :model do

  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :price}
  end

  describe "relationships" do
    it {should have_many :machine_snacks}
    it {should have_many( :machines ).through(:machine_snacks)}
  end

  describe 'methods' do
    before(:each) do
      sam = Owner.create(name: "Sam's Snacks")
      machine1 = sam.machines.create(location: "Turing Basement")
      machine2 = sam.machines.create(location: "Train Station")
      machine3 = sam.machines.create(location: "Campus Rec Room")

      @snack1 = Snack.create(name: 'Twix', price: 1.50)
      @snack1.machines.push(machine1, machine2)
      snack2 = machine2.snacks.create(name: 'Chocolate', price: 0.5)

      snack3 = machine3.snacks.create(name: 'Dont show', price: 500.0)
    end
  end
end
