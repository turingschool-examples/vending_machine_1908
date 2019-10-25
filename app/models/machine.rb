class Machine < ApplicationRecord
  belongs_to :owner
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  validates_presence_of :location

  def average_snack_price
    snacks.average(:price)
  end

  def snack_count
    snacks.count(:id)
  end
end
