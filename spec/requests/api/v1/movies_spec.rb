require "rails_helper"

RSpec.describe "Movies API V1", type: :request do
  before do
    create_list(:movie, 5)
  end

  describe "GET /api/v1/movies" do
    context "without with_genre parameter" do
      before do
        get "/api/v1/movies"
      end

      it "returns status ok" do
        expect(response).to have_http_status(:ok)
      end

      it "returns JSON with 5 records" do
        json = JSON.parse(response.body)

        expect(json.count).to eq 5
      end

      it "returns JSON without genre details" do
        json = JSON.parse(response.body)
        movie = json.first

        expect(movie["genre"]).to be_nil
      end
    end

    context "with with_genre parameter" do
      before do
        get "/api/v1/movies?with_genre=#{with_genre_param}"
      end

      context "as true" do
        let(:with_genre_param) { true }

        it "returns JSON with genre details" do
          json = JSON.parse(response.body)
          movie = json.first

          expect(movie["genre"]).not_to be_empty
        end
      end

      context "as false" do
        let(:with_genre_param) { false }

        it "returns JSON with without genre details" do
          json = JSON.parse(response.body)
          movie = json.first

          expect(movie["genre"]).to be_nil
        end
      end
    end
  end

  describe "GET /api/v1/movies/:id" do
    before do
      get "/api/v1/movies/#{id}"
    end

    context "with existent record" do
      let(:movie) { Movie.first }
      let(:id) { movie.id }

      it "returns status ok" do
        expect(response).to have_http_status(:ok)
      end

      it "returns JSON with object" do
        expect(response.body).to eq movie.to_json
      end
    end

    context "with not existent record" do
      let(:id) { 999 }

      it "returns status not_found" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns a record not found message" do
        expect(response.body).to match(/Couldn't find Movie/)
      end
    end
  end
end
