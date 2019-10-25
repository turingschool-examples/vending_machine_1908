require "rails_helper"

RSpec.describe "Snack show page" do
  before(:each) do
    owner_1 = Owner.create(name: "Jeff")
    owner_2 = Owner.create(name: "Hill")
    owner_3 = Owner.create(name: "Amy")

    machine_1 = Machine.create(location: "Turing", owner_id: owner_1.id)
    machine_2 = Machine.create(location: "Home", owner_id: owner_2.id)
    machine_3 = Machine.create(location: "Home 2", owner_id: owner_3.id)

    @snack_1 = machine_1.snacks.create(name: "Perfect Bars", price: 6)
    @snack_2 = machine_1.snacks.create(name: "Cheez-its", price: 2)

    machine_2.snacks << @snack_1
    machine_2.snacks << @snack_2
    machine_3.snacks << @snack_1
  end

  describe "When I visit a snack show page" do
    it 'I see the name of that snack' do
      visit snack_path(@snack_1)

      expect(page).to have_content(@snack_1.name)
      expect(page).to have_content(@snack_1.price)
 
      within "#snack-locations-#{@snack_1.id}" do
        expect(page).to have_content("Home")
        expect(page).to have_content("Home 2")
      end
    end
  end
end