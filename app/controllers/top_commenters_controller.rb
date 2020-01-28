class TopCommentersController < ApplicationController
  def index
    @last_week_top_commenters = Comment.last_week_top_commenters
  end
end
