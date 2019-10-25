require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
  end

  describe "relationships" do
    it { should belong_to :owner }
    it { should have_many :machine_snacks }
    it {should have_many(:snacks).through(:machine_snacks)}
  end

  describe 'instance methods' do
    it 'avg_snack_price' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      bubbas  = owner.machines.create(location: "Bubbas Shrimp")

      shrimp = Snack.create(name: "Shrimp", price: 4)
      cheetos = Snack.create(name: "Cheetos", price: 4)
      chips = Snack.create(name: "BBQ Potato Chips", price: 5)
      granola = Snack.create(name: "Healthy Wood Chips", price: 15)

      bubbas.machine_snacks.create(machine_id: bubbas.id, snack_id: shrimp.id)
      dons.machine_snacks.create(machine_id: dons.id, snack_id: cheetos.id)
      dons.machine_snacks.create(machine_id: dons.id, snack_id: chips.id)
      dons.machine_snacks.create(machine_id: dons.id, snack_id: granola.id)

      expect(dons.avg_snack_price).to eq(8.0)
    end
  end
end
