require_relative "card"

class Deck
  attr_accessor :playable_cards
  SUITS = [:hearts, :diamonds, :spades, :clubs]
  NAME_VALUES = {
    :two   => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 10,
    :queen => 10,
    :king  => 10,
    :ace   => [11, 1]}

  def initialize
    shuffle
  end

  def deal_card
    random = rand(playable_cards.size)
    playable_cards.delete_at(random)
  end

  def shuffle
    @playable_cards = []
    SUITS.each do |suit|
      NAME_VALUES.each do |name, value|
        playable_cards << Card.new(suit, name, value)
      end
    end
  end

  def deal_ace
    ace = playable_cards.select {|card| card.name == :ace}.sample
    playable_cards.delete(ace)
  end

  def deal_non_ace
    non_ace = playable_cards.reject {|card| card.name == :ace}.sample
    playable_cards.delete(non_ace)
  end

  def deal_10_value_card
    ten_val = playable_cards.select {|card| card.value == 10}.sample
    playable_cards.delete(ten_val)
  end

end