class Player
	attr_reader :is_dealer

	def initialize(name, dealer_true_or_false = false)
		@name = name
		@is_dealer = dealer_true_or_false
	end

	def is_dealer?
		is_dealer
	end

end