require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :snacks }
    it {should have_many(:snacks).through(:machine_snacks)}
  end

  describe 'class methods' do
    it "calculates average price of its snacks" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's")
      hot_cheetos = dons.snacks.create(name: "Flaming Hot Cheetos", price: 2.25)
      twix = dons.snacks.create(name: "Twix", price: 1.75)
      pringles = dons.snacks.create(name: "Pringles", price: 3.35)

      expect(dons.average_price).to eq(2)
    end
  end
end
