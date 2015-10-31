require_relative "../views/game/cli"

class GameController
	attr_reader :view

	def initialize
		@view = GameView.new
		# @round = Round.new
	end

	def set_players
		view.introductions
	end



end