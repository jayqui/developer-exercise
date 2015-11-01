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
		round.hands.each do |hand|
			view.say_whose_turn(hand.player.name)
			turn = Turn.new(hand, round)

			handle_player_actions(turn)
		end
	end

	def handle_player_actions(turn)
			action = nil
			hand = turn.hand
			until action == 's' || hand.is_blackjack || hand.is_busted

				say_cards_and_score(hand)
				action = view.ask_for_action

				case
				when hand.is_blackjack
					view.blackjack_message
					break
				when action == 'h'
					puts "HITTY HITTY HIT MAY"
				when action == 's'
					puts "STAY STAY STAY FOR A WHILE"
				end
			end
	end

	def say_cards_and_score(hand)
		view.say_cards(hand.cards)
		view.say_score(hand.score)
	end

end