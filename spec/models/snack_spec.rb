require 'rails_helper'

describe Snack do
  describe 'relationships' do
    it { should belong_to :machine }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
  end

  describe 'attributes' do
    it 'has attributes' do
      snack = Snack.new(name: 'Cheetos', price: 1.5)

      expect(snack.name).to eq('Cheetos')
      expect(snack.price).to eq(1.5)
    end 
  end
end
