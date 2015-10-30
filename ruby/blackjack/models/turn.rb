class Turn
	attr_reader :hand
	attr_accessor :player_stands

	def initialize(hand)
		@hand = hand
		@player_stands = false
	end

	def turn_over?
		player_stands || hand.is_blackjack || hand.is_busted
	end

	def hit
		
	end

end