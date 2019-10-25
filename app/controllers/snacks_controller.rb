class SnacksController < ApplicationController

  def show
    @snack = Snack.find(params[:id])
    @machines = Machine.joins(:snacks).where("snacks.name = '#{@snack.name}'").distinct(:location)
  end


end
