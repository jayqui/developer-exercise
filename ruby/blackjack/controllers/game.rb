Dir[File.dirname(__FILE__) + "/../models/*.rb"].each {|file| require file}
require_relative "../views/game/cli"

class GameController
	attr_reader :view, :round

	def initialize
		@view = GameView.new
		view.introduction
	end

	def set_players
		names = view.ask_for_player_names
		players = names.map {|name| Player.new(name)}
		@round = Round.new(players)
	end

	def play_game
		announce_dealer_show_card

		round.hands.each do |hand|
			view.say_whose_turn(hand.player.name)
			turn = Turn.new(hand, round)

			handle_player_actions(turn)
		end
		evaluate_outcomes
	end

	def handle_player_actions(turn)
			hand = turn.hand

			loop do
				say_cards_and_score(hand)

				if hand.is_blackjack
					view.blackjack_message
					break
				elsif hand.is_busted
					view.busted_message
					break
				end

				action = view.ask_for_action

				case action
				when 'h'
					turn.hit
				when 's'
					view.stand_message(hand.player.name)
					break
				end
			end
	end

	def evaluate_outcomes
		non_dealer_hands.each do |hand|
			p "hand.inspect: #{hand.inspect}"
			if max_score(hand) > max_score(dealer_hand)
				p "greater"
				outcome = 1
			elsif max_score(hand) == max_score(dealer_hand)
				p "tied"
				outcome = 0
			elsif max_score(hand) < max_score(dealer_hand)
				p "less than"
				outcome = -1
			end
			view.comparison_message(hand, outcome, dealer_hand.score)
		end
	end

	private

	def max_score(hand)
		if hand.score.is_a?(Fixnum)
			hand.score
		elsif hand.score.is_a?(Array)
			hand.score.select {|ele| ele < 21}.max
		end
	end

	def dealer_hand
		round.hands.find {|hand| hand.player.is_dealer}
	end

	def non_dealer_hands
		round.hands.reject {|hand| hand.player.is_dealer }
	end

	def announce_dealer_show_card
		show_card = dealer_hand.cards[1]
		view.say_dealer_show_card(show_card)
	end

	def say_cards_and_score(hand)
		view.say_cards(hand.cards)
		view.say_score(hand.score)
	end

end