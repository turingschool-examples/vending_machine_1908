class SnacksController < ApplicationController
  def index
    @snacks = Snack.all
  end

  def show
    @snacks = Snack.all
    @snack = Snack.find(params[:id])
  end
end
