class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_back(fallback_location: movie, notice: "Comment was successfully created.")
    else
      flash[:error] = @comment.errors.full_messages.to_sentence.capitalize
      redirect_back(fallback_location: movie)
    end
  end

  def destroy
    comment.destroy

    redirect_back(fallback_location: movie, notice: "Comment was successfully deleted.")
  end

  private

  def movie
    @movie ||= Movie.find(params[:movie_id])
  end

  def comment
    @comment ||= Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text, :movie_id, :user_id)
  end
end
