class SnacksController < ApplicationController

  def show
    @snack = Snack.find(params[:id])
    binding.pry
    @machines = Machine.find()
  end

end