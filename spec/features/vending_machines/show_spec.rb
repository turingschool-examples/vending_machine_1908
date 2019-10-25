require 'rails_helper'

RSpec.describe "Vending Machine show page" do
  it "I can see the names and prices of all snacks in a vending machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's")
    hot_cheetos = dons.snacks.create(name: "Flaming Hot Cheetos", price: 2.25)
    twix = dons.snacks.create(name: "Twix", price: 1.75)
    pringles = dons.snacks.create(name: "Pringles", price: 3.35)

    visit machine_path(dons)

    expect(page).to have_content(hot_cheetos.name)
    expect(page).to have_content(hot_cheetos.price)
    expect(page).to have_content(twix.name)
    expect(page).to have_content(twix.price)
    expect(page).to have_content(pringles.name)
    expect(page).to have_content(pringles.price)
  end

  it "I can see an average price for all the snacks in that machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's")
    hot_cheetos = dons.snacks.create(name: "Flaming Hot Cheetos", price: 2.25)
    twix = dons.snacks.create(name: "Twix", price: 1.75)
    pringles = dons.snacks.create(name: "Pringles", price: 3.35)

    visit machine_path(dons)

    expect(page).to have_content("Average price: 2")
  end
end
