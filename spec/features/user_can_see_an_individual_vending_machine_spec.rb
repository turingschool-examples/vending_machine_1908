require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
    before(:each) do
      @owner = Owner.create(name: "Sam's Snacks")
      @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
      @hot_cheetos = Snack.create(name: 'Hot Cheetos', price: 1.00)
      @smart_pop = Snack.create(name: 'Smart Pop', price: 2.00)
      @snickers = Snack.create(name: 'Snickers', price: 1.50)

      @dons.snacks << @hot_cheetos
      @dons.snacks << @smart_pop
      @dons.snacks << @snickers

      visit machine_path(@dons)
    end
  scenario 'they see the location of that machine' do

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they can see the names and prices of all snacks associated with that vending machine' do
    expect(page).to have_content('Snacks')
    expect(page).to have_content('Hot Cheetos: $1.00')
    expect(page).to have_content('Smart Pop: $2.00')
    expect(page).to have_content('Snickers: $1.50')
  end

  scenario 'they can see the average price for all snacks in that machine' do
    expect(page).to have_content('Average Price: $1.50')
  end
end
