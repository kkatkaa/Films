class Comment < ApplicationRecord
  validates :commenter, presence: true, uniqueness: true, format: /@/
  validates :body, presence: true, length: {in: 5..500}

  belongs_to :movie
end
