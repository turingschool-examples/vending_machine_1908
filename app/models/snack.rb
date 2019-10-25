class Snack < ApplicationRecord
  has_many :snack_machines
  has_many :machines, through: :snack_machines
end