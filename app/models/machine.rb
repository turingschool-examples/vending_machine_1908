class Machine < ApplicationRecord
  validates_presence_of :location

  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  belongs_to :owner

  def average_price
    snacks.average(:price)
  end
end
