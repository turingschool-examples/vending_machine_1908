require 'rails_helper'

RSpec.describe "Snack show page" do
  it "I see:
  - the name of the snack
  - the price for that snack
  - a list of locations with vending machines that carry that snack
  - the average price for snacks in those vending machines
  - a count of the different kinds of items in that vending machine" do

  owner = Owner.create(name: "Sam's Snacks")

  dons  = owner.machines.create(location: "Don's")
  angelas  = owner.machines.create(location: "Angela's")

  hot_cheetos = dons.snacks.create(name: "Flaming Hot Cheetos", price: 2.25)
  twix = dons.snacks.create(name: "Twix", price: 1.75)
  pringles = dons.snacks.create(name: "Pringles", price: 3.35)


  hot_cheetos = angelas.snacks.create(name: "Flaming Hot Cheetos", price: 2.25)
  sour_patch = angelas.snacks.create(name: "Sour Patch Kids", price: 3.25)
  beef_jerky = angelas.snacks.create(name: "Beef Jerky", price: 3.75)
  ruffles = angelas.snacks.create(name: "Ruffles", price: 1.75)

  visit snack_path(hot_cheetos)

  expect(page).to have_content(hot_cheetos.name)
  expect(page).to have_content(hot_cheetos.price)
  expect(page).to have_content("Don's Vending Machine (3 kinds of snacks, average price of $2.00)")
  expect(page).to have_content("Angela's Vending Machine (4 kinds of snacks, average price of $3.00)")
  end
end
