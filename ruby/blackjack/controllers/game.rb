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

	private

	def dealer_hand
		round.hands.find {|hand| hand.player.is_dealer}
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