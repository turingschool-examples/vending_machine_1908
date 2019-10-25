# frozen_string_literal: true

class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end
end
