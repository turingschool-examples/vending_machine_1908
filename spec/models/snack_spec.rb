require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_numericality_of :price }
  end
  
  describe 'relationships' do
    it { should have_many :machine_snacks }
    it { should have_many(:machines).through(:machine_snacks) }
  end

  describe 'class methods' do
    it 'can calculate the average price' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      sal   = owner.machines.create(location: "Sal's Snacks")
      mnt   = dons.snacks.create(name: "Mnt Dew", price: 1.50)
      dorit = sal.snacks.create(name: "Doritos", price: 1.50)
      oreo  = sal.snacks.create(name: "Oreos", price: 3.00)

      expect(Snack.average_price).to eq(2.0)
      expect(sal.snacks.average_price).to eq(2.25)
    end

    it 'can calculate the number of items' do
      owner = Owner.create(name: "Sam's Snacks")
      sal   = owner.machines.create(location: "Sal's Snacks")
      dorit = sal.snacks.create(name: "Doritos", price: 1.50)
      oreo  = sal.snacks.create(name: "Oreos", price: 3.00)

      dons  = owner.machines.create(location: "Don's Food and Drink")
      mnt   = dons.snacks.create(name: "Mnt Dew", price: 1.50)
      dons.snacks << oreo
      dons.snacks << dorit

      expect(Snack.total_snacks).to eq(3)
      expect(sal.snacks.total_snacks).to eq(2)
      expect(dons.snacks.total_snacks).to eq(3)
    end
  end
end
