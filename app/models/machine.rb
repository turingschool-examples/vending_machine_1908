class Machine < ApplicationRecord
  validates_presence_of :location

  has_many :snacks
  belongs_to :owner
end
