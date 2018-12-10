class Director < ApplicationRecord
  validates :director, presence: true, length: { minimum: 1 }
  # has_many :movies
end
