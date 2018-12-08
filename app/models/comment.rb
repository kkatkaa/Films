class Comment < ApplicationRecord
  validates :commenter, presence: true #format: /@/
  validates :body, presence: true, length: {in: 6..500}
  belongs_to :movie
end
