class Player
	attr_reader :is_dealer
	
	def initialize(dealer_true_or_false = false)
		@is_dealer = dealer_true_or_false
	end

	def is_dealer?
		is_dealer
	end

end