class Snack < ApplicationRecord
  validates_presence_of :name, :price

  belongs_to :machine
end
