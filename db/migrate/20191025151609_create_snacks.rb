class CreateSnacks < ActiveRecord::Migration[5.1]
  def change
    create_table :snacks do |t|
      t.string :name
      t.decimal :price
      t.references :machine, foreign_key: true
    end
  end
end
