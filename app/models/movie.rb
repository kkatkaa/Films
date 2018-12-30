class Movie < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1 }
  validates :year, numericality: true, length: { minimum: 4 }
  validates :duration, presence: true, length: { minimum: 5 }
  validates :genres, presence: true
  # validates :director, presence: true, length: { maximum: 100 }
  # validates :writer, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: {in: 5..500}

  has_many :comments,  dependent: :destroy

  has_many :genres_movies
  has_many :genres, through: :genres_movies

  belongs_to :user

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def tags=(value)
    value = sanitize_tags(value) if value.is_a?(String)

    super(value)
  end

  def average_rating
    self.comments.average(:rating)
  end

  private


  def sanitize_tags(text)
    text.downcase.split.uniq
  end
end
