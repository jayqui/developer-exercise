class GameView

	def introduction
		puts "Welcome to Blackjack\n\n"
	end

	def ask_for_player_names
		puts "Enter the names of up to four players, then press `Enter`"
		text, names = nil, []
		while text != "" && names.count < 4
			text = gets.chomp
			names << text unless text == ""
		end
		names
	end

end