require 'rails_helper'

RSpec.describe 'When a user visits a snack show page', type: :feature do
  before(:each) do
    @owner = Owner.create(name: "Sam's Snacks")
    @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
    @turing = @owner.machines.create(location: "Turing Basement")
    @hot_cheetos = Snack.create(name: 'Hot Cheetos', price: 1.00)
    @smart_pop = Snack.create(name: 'Smart Pop', price: 2.00)
    @snickers = Snack.create(name: 'Snickers', price: 1.50)
    @doritos = Snack.create(name: 'Doritos', price: 2.50)

    #dons snacks
    @dons.snacks << @hot_cheetos
    @dons.snacks << @smart_pop
    @dons.snacks << @snickers

    #turing snacks
    @turing.snacks << @doritos
    @turing.snacks << @hot_cheetos

    visit snack_path(@hot_cheetos)
  end

  scenario 'they can see the snack name and price' do
    expect(page).to have_content('Hot Cheetos')
    expect(page).to have_content('Price: $1.00')
  end

  scenario 'they see locations carrying that snack, along with the total number of snacks and the average snack price for that machine' do
    within '#locations' do
      expect(page).to have_content('Locations')
      expect(page).to have_content("Don's Mixed Drinks (3 kinds of snacks, average price of $1.50)")
      expect(page).to have_content('Turing Basement (2 kinds of snacks, average price of $1.75)')
    end
  end
end
