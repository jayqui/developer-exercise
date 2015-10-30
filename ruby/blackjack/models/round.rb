require_relative "player"
require_relative "deck"
require_relative "hand"

class Round
	attr_reader :deck
	attr_accessor :hands
	
	def initialize(*players)
		@deck = Deck.new
		@hands = players.map {|player| Hand.new(player, @deck.deal_card, @deck.deal_card) }
		add_dealer
	end

	def round_over?
		blackjack || dealer_stayed || dealer_busted
	end

	# private

	def blackjack

	end

	def dealer_stayed

	end

	def dealer_busted

	end

	def add_dealer
		hands << Hand.new(Player.new("Dealer",true), @deck.deal_card, @deck.deal_card)
	end

end