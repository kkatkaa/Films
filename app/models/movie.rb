class Movie < ApplicationRecord
  validates :tytuł, presence: true, length: { minimum: 1 }
  belongs_to :director 
  has_many :comments,  dependent: :destroy

end
