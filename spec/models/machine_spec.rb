require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'methods' do
    it 'can average items price' do
      sam = Owner.create(name: "Sam's Snacks")
      drinks_machine = sam.machines.create(location: "Don's Mixed Drinks")
      dr_pepper = drinks_machine.snacks.create(name: 'Dr. Pepper', price: 1.50)
      mtn_dew = drinks_machine.snacks.create(name: 'Mountain Dew', price: 2.00)

      expect(drinks_machine.avg_price).to eq(1.75)
    end
  end
end
