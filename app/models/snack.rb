class Snack < ApplicationRecord
  validates_presence_of :name, :price
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks

  def locations
    snack_id = self.id
    Machine.joins(:snacks).where('snacks.id = ?', snack_id)
  end
end
