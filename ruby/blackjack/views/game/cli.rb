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

	def say_whose_turn(player)
		puts "It's #{player}'s turn."
	end

	def say_cards(cards)
		print "The cards in this hand are: "
		cards.each do |card|
			print "#{card.name} of #{card.suit} "
		end
		puts
	end

	def say_score(score)
		print "Score: #{score}\n"
	end

	def ask_for_action
		puts "Hit (`h`) or Stand (`s`)?"
		gets.chomp
	end

	def blackjack_message
		puts "BLACKJACK!!!"
	end

end