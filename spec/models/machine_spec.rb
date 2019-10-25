require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'relationships' do
    it { should have_many :machine_snacks }
    it { should have_many :snacks }
  end

  describe 'instance methods' do
    it "can calculate the average price of its selection" do
      owner_1 = Owner.create(name: "Bob G")
      machine_1 = owner_1.machines.create(location: "Turing Basement")
      snack_1 = Snack.create(name: "Hot Cheetos", price: 1.50)
      snack_2 = Snack.create(name: "Takis", price: 1.20)
      MachineSnack.create(machine_id: machine_1.id, snack_id: snack_1.id)
      MachineSnack.create(machine_id: machine_1.id, snack_id: snack_2.id)

      expect(machine_1.average_price).to eq(1.35)
    end

    it "can count how many items it sells" do
      owner_1 = Owner.create(name: "Bob G")
      machine_1 = owner_1.machines.create(location: "Turing Basement")
      snack_1 = Snack.create(name: "Hot Cheetos", price: 1.50)
      snack_2 = Snack.create(name: "Takis", price: 1.20)
      MachineSnack.create(machine_id: machine_1.id, snack_id: snack_1.id)
      MachineSnack.create(machine_id: machine_1.id, snack_id: snack_2.id)

      expect(machine_1.count_snacks).to eq(2)
    end
  end
end
