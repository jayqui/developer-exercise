spade = "\u2660"
club = "\u2663"
heart = "\u2665"
diamond = "\u2666"

puts spade.encode('utf-8')
puts club.encode('utf-8')
puts heart.encode('utf-8')
puts diamond.encode('utf-8')

SYM = {
	"spade": "\u2660".encode('utf-8'),
	"club": "\u2663".encode('utf-8'),
	"heart": "\u2665".encode('utf-8'),
	"diamond": "\u2666".encode('utf-8')
}
	
# to color red: "\e[31m#{self}\e[0m"