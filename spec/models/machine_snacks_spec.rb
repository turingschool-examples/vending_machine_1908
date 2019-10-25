require 'rails_helper'

describe MachineSnack, type: :model do
  describe "validations" do
    it { should validate_presence_of :machine_id }
    it { should validate_presence_of :snack_id }
  end

  describe "relationships" do
    it {should belong_to :machine}
    it {should belong_to :snack}
  end

  describe 'instance methods' do
  end
end
