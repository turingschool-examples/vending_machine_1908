class AddMachinesToSnacks < ActiveRecord::Migration[5.1]
  def change
    add_reference :snacks, :machine, foreign_key: true
  end
end
