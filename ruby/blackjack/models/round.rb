require_relative "player"
require_relative "deck"
require_relative "hand"

class Round
	attr_reader :deck
	attr_accessor :hands
	
	def initialize(players_arr)
		@deck = Deck.new
		@hands = players_arr.map {|player| Hand.new(player, @deck.deal_card, @deck.deal_card) }
		add_dealer
	end

	private

	def add_dealer
		hands << Hand.new(Player.new("Dealer",true), @deck.deal_card, @deck.deal_card)
	end

end