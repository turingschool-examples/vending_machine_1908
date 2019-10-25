# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.

require 'rails_helper'

RSpec.describe "Snack show page" do
  it "will show name, price, locations, average price, and count" do
    @sam = Owner.create(name: "Sam's Snacks")
    @dons = @sam.machines.create(location: "Don's Mixed Drinks")
    @turing = @sam.machines.create(location: "Turing Basement")
    @snickers = @turing.snacks.create!(name: "Snickers", price: 1.00)
    @cheezits = @turing.snacks.create!(name: "CheezeIts", price: 2.00)
    @coke = @dons.snacks.create!(name: "Coke", price: 2.00)
    @sprite = @dons.snacks.create!(name: "Sprite", price: 4.00)

    visit "/snacks/#{@snickers.id}"

    expect(page).to have_content("Snickers")
    expect(page).to have_content(1.00)
    expect(page).to have_content("Turing Basement")
    expect(page).to have_content(1.50)
    expect(page).to have_content(2)


  end
end
