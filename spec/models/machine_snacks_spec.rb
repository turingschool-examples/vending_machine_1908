require 'rails_helper'

RSpec.describe MachineSnack, type: :model do
  describe "relationships" do
    it {should belong_to :machine}
    it {should belong_to :snack}
  end
end
