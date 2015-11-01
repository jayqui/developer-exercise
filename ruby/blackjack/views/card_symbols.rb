SPADE_CODE = "\u2660"
CLUB_CODE = "\u2663"
HEART_CODE = "\u2665"
DIAMOND_CODE = "\u2666"

SYM = {
	spades: SPADE_CODE.encode('utf-8'),
	clubs: CLUB_CODE.encode('utf-8'),
	hearts: "\e[31m#{HEART_CODE.encode('utf-8')}\e[0m",
	diamonds: "\e[31m#{DIAMOND_CODE.encode('utf-8')}\e[0m"
}
	
# to color red: "\e[31m#{self}\e[0m"

NAME_SYMBOLS = {
  :two   => 2,
  :three => 3,
  :four  => 4,
  :five  => 5,
  :six   => 6,
  :seven => 7,
  :eight => 8,
  :nine  => 9,
  :ten   => 10,
  :jack  => "J",
  :queen => "Q",
  :king  => "K",
  :ace   => "A"}