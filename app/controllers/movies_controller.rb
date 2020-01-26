class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:send_info]

  def index
    @movies = Movie.all.includes(:genre).page(params[:page]).per(5)
  end

  def show
    @movie = Movie.find(params[:id]).decorate
  end

  def send_info
    @movie = Movie.find(params[:id])
    MovieInfoMailer.send_info(current_user, @movie).deliver_later

    redirect_back(fallback_location: root_path,
                  notice: "Soon you will receive an email with movie info")
  end

  def export
    MovieExporterJob.perform_later(current_user)

    redirect_to root_path, notice: "Soon you will receive an email with exported movies"
  end
end
