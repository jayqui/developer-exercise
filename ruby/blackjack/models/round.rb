require_relative "player"
require_relative "deck"
require_relative "hand"

class Round
	attr_reader :deck, :hands
	
	def initialize(*players)
		@deck = Deck.new
		@hands = players.map {|player| Hand.new(player, @deck.deal_card, @deck.deal_card) }
	end

	def deal_cards

	end

end