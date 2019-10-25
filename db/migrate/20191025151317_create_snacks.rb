class CreateSnacks < ActiveRecord::Migration[5.1]
  def change
    create_table :snacks do |t|
      t.string :name
      t.float :price
      t.references :machine, foreign_key: true

      t.timestamps
    end
  end
end
