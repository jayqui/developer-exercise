require_relative "../card_symbols"

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
		puts "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"
		puts "========= #{player}'s turn. ========="
		puts "/////////////////////////////"
	end

	def say_dealer_show_card(card)
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		print "!! The dealer is showing: "
		print "#{NAME_SYMBOLS[card.name]}#{SYM[card.suit]} !!\n"
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		puts
	end

	def say_cards(cards)
		puts
		cards.each do |card|
			print "#{NAME_SYMBOLS[card.name]}#{SYM[card.suit]} "
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
		puts "BLACKJACK!!!\n\n"
	end

	def busted_message
		puts "BUSTED!!!\n\n"
	end

	def stand_message(player)
		puts "#{player} stands.\n\n"
	end

	def comparison_message(hand, outcome, dealer_score)
		case outcome
		when 1 then puts "#{hand.player.name} (#{hand.max_score}#{' (BUSTED)' if hand.is_busted}) beats dealer (#{dealer_score}#{' (BUSTED)' if dealer_score > 21})"
		when 0 then puts "#{hand.player.name} (#{hand.max_score}#{' (BUSTED)' if hand.is_busted}) ties dealer (#{dealer_score}#{' (BUSTED)' if dealer_score > 21})"
		when -1 then puts "#{hand.player.name} (#{hand.max_score}#{' (BUSTED)' if hand.is_busted}) loses to dealer (#{dealer_score}#{' (BUSTED)' if dealer_score > 21})"
		end
	end

end