class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  def avg_price
    snacks.average(:price)
  end

  def count_of_snacks
    snacks.length
  end
end
