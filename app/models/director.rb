class Director < ApplicationRecord
  validates :director_name, presence: true, length: { minimum: 1 }
  has_many :movies
end
