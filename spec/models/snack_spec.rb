# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should validate_numericality_of :price }

    it { should have_many :machine_snacks }
    it { should have_many(:machines).through(:machine_snacks) }
  end
end
