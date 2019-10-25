require 'rails_helper'

RSpec.describe Snack, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }

    it { should validate_numericality_of :price }
  end

  describe 'relationships' do
    it { should have_many(:machines).through(:machine_snacks) }
  end

  describe 'class methods' do
    it 'can calculate the average price' do
      owner  = Owner.create(name: "Sam's Snacks")
      dons   = owner.machines.create(location: "Don's Mixed Drinks")

      dons.snacks.create(name: 'White Castle Burger', price: 3.50)
      dons.snacks.create(name: 'Pop Rocks', price: 1.50)
      dons.snacks.create(name: 'Flaming Hot Cheetos', price: 2.00)
      dons.snacks.create(name: 'Snickers Bar', price: 1.50)

      expect(Snack.average_price).to eq(2.125)
    end
  end

end
