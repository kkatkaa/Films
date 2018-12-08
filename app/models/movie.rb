class Movie < ApplicationRecord
  validates :tytuł, presence: true, length: { minimum: 1 }
  has_many :comments,  dependent: :destroy
end
