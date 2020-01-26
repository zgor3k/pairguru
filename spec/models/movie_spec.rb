require "rails_helper"

RSpec.describe Movie, type: :model do
  let(:movie) { build(:movie) }

  describe "#by_api" do
    subject { movie.by_api }

    context "calls external ApiPerformer service" do
      let(:api_performer) { MovieServices::ApiPerformer }

      it "returns ApiPerformer object" do
        expect(subject.class).to eq(api_performer)
      end
    end
  end
end
