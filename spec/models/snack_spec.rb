require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :price}
    it { should have_many :machine_snacks}
    it { should have_many(:machines).through(:machine_snacks) }
  end

  describe 'class methods' do
    it 'can calculate average price of all snacks' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      nuts = dons.snacks.create!(name: 'Organic Mixed Nuts', price: 10)
      chips = dons.snacks.create!(name: 'Biff\'s Chips', price: 8)

      expect(Snack.average_price).to eq(9.00)
    end
  end
end
