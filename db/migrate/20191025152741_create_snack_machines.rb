class CreateSnackMachines < ActiveRecord::Migration[5.1]
  def change
    create_table :snack_machines do |t|
      t.references :machine, foreign_key: true
      t.references :snack, foreign_key: true

      t.timestamps
    end
  end
end
