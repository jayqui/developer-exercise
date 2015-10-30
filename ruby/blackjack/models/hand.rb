class Hand
	attr_reader :player
  attr_accessor :cards, :score

  def initialize(player, *cards)
    @cards = cards
    @player = player
  end

  def score
  	@cards.inject(0) do |accum, card|
  		if card.value.is_a?(Fixnum)
  			accum + card.value
  		elsif card.value.is_a?(Array)
  			accum + card.value[1]
  		end
  	end
  end

end