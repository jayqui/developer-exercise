Dir[File.dirname(__FILE__) + "/../models/*.rb"].each {|file| require file}
require_relative "../views/game/cli"

class GameController
	attr_reader :view, :round

	def initialize
		@view = GameView.new
		view.introduction
	end

	def set_players
		players = view.ask_for_player_names
		@round = Round.new(players)
	end



end