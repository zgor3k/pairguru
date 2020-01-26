class Utils::ApiRequesterService
  PAIRGURU_API = "https://pairguru-api.herokuapp.com".freeze

  def initialize(movie_title)
    @movie_title = movie_title
  end

  def call
    JSON.parse(data).with_indifferent_access[:data]
  end

  private

  def data
    RestClient.get(parsed_link)
  rescue RestClient::ExceptionWithResponse => e
    Rails.logger.error e
  end

  def parsed_link
    Addressable::URI.parse(movie_address).normalize.to_s
  end

  def movie_address
    "#{PAIRGURU_API}/api/v1/movies/#{@movie_title}"
  end
end
