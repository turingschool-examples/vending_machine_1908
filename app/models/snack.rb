class Snack < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :price

  belongs_to :machine
end