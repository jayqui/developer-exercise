Dir[File.dirname(__FILE__) + "/../models/*.rb"].each {|file| require file}
require_relative "../views/game/cli"

class GameController
	attr_reader :view, :round

	def initialize
		@view = GameView.new
	end

	def set_players
		players = view.introduction
		@round = Round.new(players)
	end



end