module CommentHelper
  def commented_by_current_user?(comment)
    comment.user == current_user
  end
end
