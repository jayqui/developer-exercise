class Turn
	attr_reader :hand, :round
	attr_accessor :player_stands

	def initialize(hand, round)
		@hand, @round = hand, round
		@player_stands = false
	end

	def hit
		hand.cards << round.deck.deal_card
	end

	def double_down
	end

	def split
	end

end