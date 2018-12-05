class Movie < ApplicationRecord
  validates :tytuł, presence: true, length: { minimum: 1 }
end
