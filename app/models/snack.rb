class Snack < ApplicationRecord
  validates_presence_of :name, :price

  belongs_to :machine

  def self.average_price
    average(:price)
  end
end
