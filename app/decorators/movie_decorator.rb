class MovieDecorator < Draper::Decorator
  delegate_all

  def cover
    "#{api_url}/#{by_api.poster}"
  end

  def rating
    by_api.rating
  end

  def plot
    by_api.plot
  end

  def rated_title
    "#{title} #{by_api.rating}"
  end

  private

  def api_url
    Utils::ApiRequesterService::PAIRGURU_API
  end
end
