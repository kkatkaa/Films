class Movie < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1 }
  validates :year, numericality: true, length: { minimum: 4 }
  validates :duration, presence: true, length: { minimum: 5 }
  validates :genre, presence: true, length: { minimum: 5 }
  validates :director, presence: true, length: { maximum: 100 }
  validates :writer, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: {in: 5..500}

  has_many :comments,  dependent: :destroy

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
