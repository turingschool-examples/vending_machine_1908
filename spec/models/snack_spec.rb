require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe "relationships" do
    it { should have_many(:machines).through(:snack_machines) }
  end
end