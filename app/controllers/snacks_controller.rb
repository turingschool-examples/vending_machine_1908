# frozen_string_literal: true

class SnacksController < ApplicationController
  def show
    @snack = Snack.find(params[:id])
  end
end
