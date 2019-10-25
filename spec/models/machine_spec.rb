require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
  end

  describe 'relationships' do
    it { should belong_to :owner }
    it { should have_many :snacks }
  end

  describe 'class methods' do
    it "average_price can return average price" do
      sam = Owner.create(name: "Sam's Snacks")
      turing = sam.machines.create(location: "Turing Basement")
      snickers = turing.snacks.create!(name: "Snickers", price: 1.00)
      cheezits = turing.snacks.create!(name: "CheezeIts", price: 2.00)

      average = Snack.all

      expect(average.average_price).to eq(1.50)
    end
  end
end
