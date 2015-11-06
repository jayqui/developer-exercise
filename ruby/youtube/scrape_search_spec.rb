require_relative "scrape_search"

describe "YouTubeSearch" do

	let(:yt) { YouTubeSearch.new }
	let(:query) { yt.search_youtube("crazy cats !!",5) }

	describe "#get_query" do
		before { allow(yt).to receive(:gets).and_return("crazy cats !!") }
		it "returns the plusified query" do
			expect(yt.get_query).to eq("crazy+cats+!!")
		end
	end

	describe "#ask_how_many" do
		before { allow(yt).to receive(:gets).and_return("5") }
		it "returns the integer version of the string" do
			expect(yt.ask_how_many).to eq(5)
		end
	end

	describe "#search_youtube" do
		it "returns an array" do
			expect(query).to be_a(Array)
		end
		it "an array of URLs" do
			each_is_url = query.map {|element| element.start_with?("https://www.youtube.com/watch?v=") ? true : false}.uniq!
			expect(each_is_url).to eq([true])
		end
	end
end