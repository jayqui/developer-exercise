class Turn
	attr_reader :hand
	attr_accessor :player_stands

	def initialize(hand)
		@hand = hand
		@player_stands = false
	end

	def hit
		
	end

	def double_down
	end

	def split
	end

end