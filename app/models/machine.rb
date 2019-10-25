class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :snacks

  def avg_price
    snacks.average(:price)
  end
end
