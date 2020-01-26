class MovieServices::ApiPerformer
  def initialize(movie)
    @movie = movie
  end

  def plot
    attributes[:plot]
  end

  def rating
    attributes[:rating]
  end

  def poster
    attributes[:poster]
  end

  private

  def attributes
    @attributes ||= movie_by_api[:attributes]
  end

  def movie_by_api
    @movie_by_api ||= ::Utils::ApiRequesterService.new(@movie.title).call
  end
end
