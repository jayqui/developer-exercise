###############################
###############################
puts ">>>> Enter text to search for on YouTube: "
search_query = gets.chomp
puts ">>>> How many videos would you like (up to 20)?"
how_many = gets.chomp.to_i
###############################
###############################


plusified = search_query.split(" ").join("+")

require 'net/http'
require 'nokogiri'
require 'open-uri'

uri = "https://www.youtube.com/results?search_query=#{plusified}"
doc = Nokogiri::HTML(open(uri))
h3_objects = doc.css(".yt-lockup-title").take(how_many)
results = h3_objects.map do |h3|
	link_objects = h3.children.select {|child| child.name == "a"}
	link_objects.map do |link|
		"https://www.youtube.com" + link.attributes["href"].value
	end[0]
end
p results


# Note to self: for future coolness:

#### Obviously, you could add an in-browser front end that supplies the string and number via html <input>s
#
#### You could also embed the results right on the search page with the 'embed' feature (see tab below any video)---they just give you an iframe like so:
#
# <iframe width="560" height="315" src="https://www.youtube.com/embed/Cmuc2Zu7I0Q" frameborder="0" allowfullscreen></iframe>