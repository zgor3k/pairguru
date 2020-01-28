class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :movie, uniqueness: { scope: :user }
  validates :text, presence: true

  scope :last_week_top_commenters, -> do
    select("user_id, count(user_id) as comment_count")
      .includes(:user)
      .where("created_at >= ?", 7.days.ago.to_date)
      .group(:user_id)
      .order("comment_count DESC")
      .limit(10)
  end
end
