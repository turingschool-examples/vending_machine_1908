require 'rails_helper'

describe Snack, type: :model do

  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :price}
  end

  describe "relationships" do
    it {should belong_to :machine}
  end
end
