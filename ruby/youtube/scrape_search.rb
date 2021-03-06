require 'net/http'
require 'nokogiri'
require 'open-uri'

class YouTubeSearch
	def get_query
		puts ">>>> Enter text to search for on YouTube: "
		search_query = gets.chomp
		search_query.split(" ").join("+")
	end

	def ask_how_many
		puts ">>>> How many videos would you like (up to 20)?"
		gets.chomp.to_i
	end

	def search_youtube(plusified_query, how_many)
		uri = "https://www.youtube.com/results?search_query=#{plusified_query}"
		doc = Nokogiri::HTML(open(uri))
		h3_objects = doc.css(".yt-lockup-title").take(how_many)
		results = h3_objects.map do |h3|
			link_objects = h3.children.select {|child| child.name == "a"}
			link_objects.map do |link|
				"https://www.youtube.com" + link.attributes["href"].value
			end[0]
		end
		results
	end
end

yt = YouTubeSearch.new
plusified_query = yt.get_query
how_many = yt.ask_how_many
p yt.search_youtube(plusified_query,how_many)