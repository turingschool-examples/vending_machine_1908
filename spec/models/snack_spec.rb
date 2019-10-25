require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should have_many :machine_snacks }
    it { should have_many :machines }
  end

  describe "class methods" do
    it "can average price for all snacks" do
      snack_1 = Snack.create(name: "Chips",
                            price: 2)
      snack_2 = Snack.create(name: "Granola Bar",
                            price: 2)
      expect(Snack.average_price).to eq(2)
    end
  end
end
