class Movie < ApplicationRecord
  validates :tytuł, presence: true, length: { minimum: 1 }
  validates :rok_produkcji, numericality: true, length: { minimum: 4 }
  validates :czas_trwania, presence: true, length: { minimum: 5 }
  validates :gatunek, presence: true, length: { minimum: 5 }
  validates :reżyseria, presence: true, length: { maximum: 100 }
  validates :scenariusz, presence: true, length: { maximum: 100 }
  validates :opis, presence: true, length: {in: 5..500}

  has_many :comments,  dependent: :destroy
end
