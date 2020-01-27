class UsersController < ApplicationController
  def top_commenters
    @top_commenters =
      Comment.select("user_id, count(user_id) as comment_count")
        .includes(:user)
        .where("created_at >= ?", 7.days.ago.to_date)
        .group(:user_id)
        .order("comment_count DESC")
        .limit(10)
  end
end
