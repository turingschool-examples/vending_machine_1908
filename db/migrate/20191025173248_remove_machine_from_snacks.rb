class RemoveMachineFromSnacks < ActiveRecord::Migration[5.1]
  def change
    remove_reference :snacks, :machine, foreign_key: true
  end
end
