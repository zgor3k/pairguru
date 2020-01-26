require "rails_helper"

RSpec.describe MovieServices::ApiPerformer, type: :module do
  let(:api_performer) { described_class }

  describe "#new" do
    subject { api_performer.new(movie) }

    context "with movie" do
      let(:movie) { build(:movie) }

      it "successfully instantiates described class" do
        expect { subject }.to_not raise_error
      end
    end
  end
end
