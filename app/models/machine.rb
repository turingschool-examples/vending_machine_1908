class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :snacks


  def average_price
    snacks.average(:price)
  end


  def snack_count
    snacks.length
  end

  
end
