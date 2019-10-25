require 'rails_helper'

RSpec.describe 'When I visit a vending machine show page', type: :feature do
  before(:each) do
    @brothers_machine = Machine.create(location: 'Brothers')
    @turing_machine = Machine.create(location: 'Turing')

    @jerky = @machine_1.snacks.create(name: 'Jerky', price: 2.50)
    @pop_tart = @machine_1.snacks.create(name: 'Strawberry PopTart', price: 1.50)
  end

  it 'it shows all snacks associated with a vending machine and its prices' do
    visit '/show'

    expect(page).to have_content('Jerky')
    expect(page).to have_content(2.50)
    expect(page).to have_content('Strawberry PopTart')
    expect(page).to have_content(1.50)
  end
end


# As a user
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price
