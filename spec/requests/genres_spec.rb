require "rails_helper"

describe "Genres requests", type: :request do
  let!(:genres) { create_list(:genre, 5, :with_movies) }
  let(:api_requester) { Utils::ApiRequesterService }
  let(:movie_attributes) { { attributes: { rating: nil, plot: nil, cover: nil } } }

  before do
    allow_any_instance_of(api_requester).to receive(:call).and_return(movie_attributes)
  end

  describe "genre list" do
    it "displays only related movies" do
      visit "/genres/" + genres.sample.id.to_s + "/movies"
      expect(page).to have_selector("table tr", count: 5)
    end
  end
end
