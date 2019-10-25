require 'rails_helper'


describe 'when a user visits a snack show page' do
  scenario 'I see snack name and machine locations with average price and item count for machine' do
    sam = Owner.create(name: "Sam's Snacks")
    don = Owner.create(name: "Don's Snacks")
    mike = Owner.create(name: "Mike's Snacks")

    mikes = mike.machines.create(location: "Sal's Corner")
    dons  = don.machines.create(location: "Wallaby Way")
    sams = sam.machines.create(location: "Turing Basement")

    pop_rocks = dons.snacks.create(name: 'Pop Rocks', price: 1.5)
    cheetos = dons.snacks.create(name: 'Cheetos', price: 1.0)
    pringles = dons.snacks.create(name: 'PopDontStop', price: 1.75)
    reeses = dons.snacks.create(name: 'Reeses', price: 1.25)
    trail_mix = dons.snacks.create(name: 'Go Nuts', price: 2.5)


    snickers = sams.snacks.create(name: 'Snickers', price: 1.75)
    reeses = sams.snacks.create(name: 'Reeses', price: 1.25)
    trail_mix = sams.snacks.create(name: 'Go Nuts', price: 2.5)
    pop_rocks = sams.snacks.create(name: 'Pop Rocks', price: 1.5)
    cheetos = sams.snacks.create(name: 'Cheetos', price: 1.0)
    pringles = sams.snacks.create(name: 'PopDontStop', price: 1.75)


    visit snack_path(pop_rocks)

    expect(page). to have_content('Pop Rocks')

    within "#locations-#{dons.id}" do
      expect(page).to have_content("Wallaby Way")
      expect(page).to have_content("Kinds of Snacks: 5")
      expect(page).to have_content("Average Price of Snacks: $1.60")
    end

    within "#locations-#{sams.id}" do
      expect(page).to have_content("Turing Basement")
      expect(page).to have_content("Kinds of Snacks: 6")
      expect(page).to have_content("Average Price of Snacks: $1.63")
    end
  end
end
