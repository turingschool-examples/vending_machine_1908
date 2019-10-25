require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end

  describe 'roles' do
    it "can be created by a default user" do
      user = User.create!(name: 'Jo', email: 'jo@jo.com')

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end
  end
end
