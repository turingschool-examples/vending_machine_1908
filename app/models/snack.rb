class Snack < ApplicationRecord
  validates_presence_of :name
  validates_numericality_of :price
  
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks

  def self.average_price
    average(:price)
  end

  def self.total_snacks
    count
  end
end