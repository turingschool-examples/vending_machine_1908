class Snack < ApplicationRecord
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks

  validates_presence_of :name
  validates_presence_of :price

  def self.average_price
    average(:price)
  end

end
