class GameView

	def introduction
		puts "Welcome to Blackjack\n\n"
	end

	def ask_for_player_names
		puts "Enter the names of up to four players, then press `Enter`"
		text, counter, names = "", 0, []
		while text != ""
			text = gets.chomp
			names << text
			counter += 1
		end
		names
	end

end