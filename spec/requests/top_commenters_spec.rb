require "rails_helper"

describe "Top commenters requests", type: :request do
  describe "top commenters list" do
    it "displays right title" do
      visit "/top_commenters"
      expect(page).to have_selector("h1", text: "Top commenters")
    end
  end
end
