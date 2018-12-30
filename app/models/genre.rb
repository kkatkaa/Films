class Genre < ApplicationRecord
  has_many :genres_movie
  has_many :movies, through: :genres_movie
end
