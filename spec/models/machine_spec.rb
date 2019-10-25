require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
  end

  describe 'relationships' do
    it { should belong_to :owner }

    it { should have_many(:snacks).through(:machine_snacks) }
  end

  describe 'instance methods' do
    it 'can count the number of snacks it has' do
      owner  = Owner.create(name: "Sam's Snacks")
      wilmas = owner.machines.create(location: "Wilma's Diner")

      wilmas.snacks.create(name: 'Pop Rocks', price: 1.50)
      wilmas.snacks.create(name: 'White Castle Burger', price: 3.50)
      wilmas.snacks.create(name: 'Flaming Hot Cheetos', price: 2.00)

      expect(wilmas.snack_count).to eq(3)
    end
  end
end
