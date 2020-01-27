class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :movie, uniqueness: { scope: :user }
  validates :text, presence: true
end
