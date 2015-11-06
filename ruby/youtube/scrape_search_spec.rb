require_relative "scrape_search"

describe "YouTubeSearch" do

	let(:yt) { YouTubeSearch.new }

	describe "#get_query" do
		before do
	    allow(yt)
	      .to receive(:gets)
	      .and_return("crazy cats !!")
	  end
		it "returns the plusified query" do
			expect(yt.get_query).to eq("crazy+cats+!!")
		end
	end
end