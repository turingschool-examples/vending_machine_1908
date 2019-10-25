# frozen_string_literal: true

class MachineSnack < ApplicationRecord
  belongs_to :machine
  belongs_to :snack
end
