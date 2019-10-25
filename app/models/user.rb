class User < ApplicationRecord
  validates_presence_of :name, :email

  enum role: [:default]
end
