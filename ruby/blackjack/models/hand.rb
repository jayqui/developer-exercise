class Hand
	attr_reader :player, :is_blackjack
  attr_accessor :cards, :score

  def initialize(player, *cards)
    @cards = cards
    @player = player
    is_blackjack?
  end

  def score
  	if number_of_aces == 0
			sum_total
	  else
	  	subtotal = sum_total(cards_other_than_aces)
	  	ace_sums.map {|sum| sum + subtotal}
  	end
  end

  def max_score
    if score.is_a?(Fixnum)
      score
    elsif score.is_a?(Array)
      scores_under_21 = score.select {|ele| ele <= 21}
      scores_under_21.max || score.min
    end
  end

  def is_blackjack?
		if cards.size == 2 && score == [11,21]
	  	@is_blackjack = true
		end
  end

  def is_busted
    if score.is_a?(Fixnum)
      score > 21
    elsif score.is_a?(Array)
      score.min > 21
    end
  end

  private

  def sum_total(collection = nil)
  	collection ||= self.cards
  	collection.inject(0) do |accum, card|
  		accum + card.value
  	end
  end

  def aces
  	cards.select {|card| card.name == :ace }
  end

  def cards_other_than_aces
  	cards.reject {|card| card.name == :ace }
  end

  def number_of_aces
  	aces.count
  end

  def ace_sums
  	possible_ace_values = aces.map {|ace| ace.value}.flatten
  	combinations = possible_ace_values.combination(number_of_aces)
  	combinations.map {|combo| combo.inject(:+)}.uniq.sort
  end

end