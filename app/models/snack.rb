class Snack < ApplicationRecord
  validates_presence_of :name, :price
  belongs_to :machine


  def locations
    snack_id = self.id
    Machine.joins(:snacks).where('snacks.id = ?', snack_id)
    binding.pry
  end
end
