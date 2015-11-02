require_relative "controllers/game"

gc = GameController.new
gc.set_players
gc.simulate_game