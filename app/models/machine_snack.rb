class MachineSnack < ApplicationRecord
  belongs_to :machine
  belongs_to :snack

  validates_presence_of :machine_id,
                        :snack_id
end
