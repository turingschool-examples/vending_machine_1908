require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :snacks }
  end

  describe 'instance methods' do
    before(:each) do
      owner = Owner.create(name: 'Sam')
      @machine = owner.machines.create(location: 'NYC Treats')

      snack_1 = @machine.snacks.create(name: 'Reeses', price: 1.00)
      snack_2 = @machine.snacks.create(name: 'Reeses', price: 2.00)
      snack_3 = @machine.snacks.create(name: 'Reeses', price: 3.00)
    end
    it 'can calculate average snack price' do
      expect(@machine.average_snack_price).to eq(2.00)
    end
    it 'can calculcate number of items' do
      expect(@machine.snack_count).to eq(3)
    end
  end
end
