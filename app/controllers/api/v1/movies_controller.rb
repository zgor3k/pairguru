class Api::V1::MoviesController < ApplicationController
  def index
    @movies = Movie.all.select(:id, :title, :genre_id).includes(:genre)
    @with_genre = data_with_genre?
  end

  def show
    @movie = Movie.find(params[:id])

    render json: @movie
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: e.message }, status: :not_found
  end

  private

  def data_with_genre?
    params[:with_genre] == "true"
  end
end
