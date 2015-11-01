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
			# p hand.player
			view.say_whose_turn(hand.player.name)
			view.say_cards(hand.cards)
			handle_player_actions
		end
	end

	def handle_player_actions
			view.ask_for_action
			
	end

end