class Comment < ApplicationRecord
  include ActiveModel::Validations
  validates :user, presence: true, uniqueness: true
  validates :body, presence: true, length: {in: 5..500}
  validates :rating, numericality: true, :inclusion => 1..10

  belongs_to :movie, class_name: "Movie", foreign_key: :movie_id
  belongs_to :user
end
