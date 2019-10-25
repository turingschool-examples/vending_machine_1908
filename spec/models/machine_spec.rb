require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :machine_snacks }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  describe 'instance methods' do
    it 'average snack price' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      hot_cheetos = Snack.create(name: 'Hot Cheetos', price: 1.00)
      smart_pop = Snack.create(name: 'Smart Pop', price: 2.00)
      snickers = Snack.create(name: 'Snickers', price: 1.50)

      dons.snacks << hot_cheetos
      dons.snacks << smart_pop
      dons.snacks << snickers

      expect(dons.average_snack_price).to eq(1.50)
    end

    it 'snack count' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      hot_cheetos = Snack.create(name: 'Hot Cheetos', price: 1.00)
      smart_pop = Snack.create(name: 'Smart Pop', price: 2.00)
      snickers = Snack.create(name: 'Snickers', price: 1.50)

      dons.snacks << hot_cheetos
      dons.snacks << smart_pop
      dons.snacks << snickers

      expect(dons.snack_count).to eq(3)
    end
  end
end
