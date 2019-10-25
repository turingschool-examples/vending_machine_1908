# As a visitor
# When I visit a vending machine show page
# I also see an average price for all of the snacks in that machine
require 'rails_helper'

RSpec.describe "As a user" do
  before(:each) do
    @sam = Owner.create(name: "Sam's Snacks")
    @dons = @sam.machines.create(location: "Don's Mixed Drinks")
    @turing = @sam.machines.create(location: "Turing Basement")
    @snickers = @turing.snacks.create!(name: "Snickers", price: 1.00)
    @cheezits = @turing.snacks.create!(name: "CheezeIts", price: 2.00)
    @coke = @dons.snacks.create!(name: "Coke", price: 2.00)
    @sprite = @dons.snacks.create!(name: "Sprite", price: 4.00)
  end

  it "I will see name and price of all items in vending machine" do

    visit "/machines/#{@dons.id}"

    expect(page).to have_content("Coke")
    expect(page).to have_content(2.00)
    expect(page).to have_content("Sprite")
    expect(page).to have_content(4.00)

    visit "/machines/#{@turing.id}"

    expect(page).to have_content("Snickers")
    expect(page).to have_content(1.00)
    expect(page).to have_content("CheezeIts")
    expect(page).to have_content(2.00)
  end

  it "will show average price of all snacks" do
    visit "/machines/#{@dons.id}"

    expect(page).to have_content(3.00)

    visit "/machines/#{@turing.id}"

    expect(page).to have_content(1.50)
  end
end
