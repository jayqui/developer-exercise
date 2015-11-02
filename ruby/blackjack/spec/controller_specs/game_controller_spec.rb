require_relative "../../controllers/game.rb"

describe "GameController" do

	let(:gc) { GameController.new }
	let(:view) { GameView.new }

	let(:test_round) { Round.new([]) }

	let(:non_lucky_player) { Player.new("Joe McPlain") }
	let(:non_lucky_round) { Round.new([non_lucky_player]) }
	let(:non_lucky_hand_array) { [Hand.new(non_lucky_player, gc.round.deck.deal_non_ace, gc.round.deck.deal_non_ace)] }

	let(:lucky_player) { Player.new("Lady Luck") }
	let(:lucky_round) { Round.new([lucky_player]) }
	let(:lucky_hand_array) { [Hand.new(lucky_player, gc.round.deck.deal_ace, gc.round.deck.deal_10_value_card)] }

	let(:busted_hand_with_ace) { Hand.new(lucky_player, gc.round.deck.deal_ace, gc.round.deck.deal_10_value_card, gc.round.deck.deal_10_value_card, gc.round.deck.deal_10_value_card) }

	# test hands
	let(:hand_19) { Hand.new(Player.new("Mr. 19"), Card.new(:spades, :ace, [1,11]), Card.new(:hearts, :six, 6), Card.new(:hearts, :two, 2)) }
	let(:hand_20) { Hand.new(Player.new("Dr. 20"), Card.new(:spades, :king, 10), Card.new(:hearts, :jack, 10)) }
	let(:hand_30) { Hand.new(Player.new("Ms. 30"), Card.new(:spades, :king, 10), Card.new(:hearts, :king, 10), Card.new(:hearts, :queen, 10)) }

	# test hands: dealer
	let(:dealer_hand_19) { Hand.new(Player.new("Dealer", true), Card.new(:spades, :ace, [1,11]), Card.new(:hearts, :six, 6), Card.new(:hearts, :two, 2)) }
	let(:dealer_hand_20) { Hand.new(Player.new("Dealer", true), Card.new(:spades, :king, 10), Card.new(:hearts, :jack, 10)) }
	let(:dealer_hand_31) { Hand.new(Player.new("Dealer", true), Card.new(:spades, :king, 10), Card.new(:hearts, :king, 10), Card.new(:hearts, :queen, 10), Card.new(:spades, :ace, [1,11])) }
	

	before(:each) do
    io_obj = double
    expect(view)
      .to receive(:gets)
      .and_return(io_obj)
      .at_least(:once)
    expect(io_obj)
      .to receive(:chomp)
      .and_return("Cal")
    expect(io_obj)
      .to receive(:chomp)
      .and_return("Dale")
    expect(io_obj)
      .to receive(:chomp)
      .and_return("")

    allow(gc).to receive(:view) { view }
  end

	describe "#set_players" do

		it "should return a valid round" do
			expect(gc.set_players).to be_a(Round)
		end

		it "should have players equivalent to those entered in the view" do
			expect(gc.set_players.hands.map {|hand| hand.player.name }).to eq(["Cal","Dale","Dealer"])
		end
	end

	describe "#handle_player_actions" do

		context "when hand is not a blackjack" do
			before(:each) do
				gc.set_players

				allow(view)
				.to receive(:ask_for_action)
				.and_return('h')

				# rig a hand that does not get dealt a blackjack
				allow(non_lucky_round).to receive(:hands) { non_lucky_hand_array }
				allow(gc).to receive(:round) { non_lucky_round }

				hand = gc.round.hands[0]
				turn = Turn.new(hand, gc.round)
				gc.handle_player_actions(turn)
			end

			it "should increase the card count by one one for each hit" do
				expect(gc.round.hands[0].cards.count).to be > 2
			end

			# 50.times do
				it "should hit until a bust (every time)" do
					expect(gc.round.hands[0].is_busted).to be true
				end
			# end

		end

		context "when hand is a blackjack" do
			before(:each) do
				gc.set_players

				allow(view)
				.to receive(:ask_for_action)
				.and_return('h')

				# rig a lucky hand that gets dealt a (random) blackjack
				allow(lucky_round).to receive(:hands) { lucky_hand_array }
				allow(gc).to receive(:round) { lucky_round }

				hand = gc.round.hands[0]
				turn = Turn.new(hand, gc.round)
				gc.handle_player_actions(turn)
			end

			# 10.times do
				it "this mock successfully produces a blackjack in the first hand (always)" do
					expect(gc.round.hands[0].score == [11,21] && gc.round.hands[0].cards.count == 2).to eq(true)
				end
			# end

			it "should return a success message before any action takes place" do
				expect(gc.round.hands[0].cards.count).to eq(2)
			end
		end
	end

	describe "#play_game" do
		before(:each) do
			gc.set_players

			allow(view)
			.to receive(:ask_for_action)
			.and_return('h')
		end

		it "returns an array of hands" do
			expect(gc.play_game.class == Array && gc.play_game[0].class).to eq(Hand)
		end
	end

	describe "#simulate_game" do
		before(:each) do
			gc.set_players

			allow(view)
			.to receive(:ask_for_action)
			.and_return('h')
		end

		it "returns an array of hands" do
			expect(gc.play_game.class == Array && gc.play_game[0].class).to eq(Hand)
		end
	end

	describe "#evaluate_outcome" do
		before(:each) do
			gc.set_players
		end

		def eval_first_hand
			gc.evaluate_outcome(gc.round.hands.first)
		end
		def test_hands(*hands)
			allow(test_round).to receive(:hands) { hands }
			allow(gc).to receive(:round) { test_round }
		end

		it "should return 0 if the hands are equal" do
			test_hands(hand_19, dealer_hand_19)
			expect(eval_first_hand).to eq(0)
		end
		it "should return 0 if hand & dealer hand are both busted" do
			test_hands(hand_30, dealer_hand_31)
			expect(eval_first_hand).to eq(0)
		end
		it "should return 1 if non-busted player hand beats dealer" do
			test_hands(hand_20, dealer_hand_19)
			expect(eval_first_hand).to eq(1)
		end
		it "should return -1 if non-busted dealer beats player" do
			test_hands(hand_19, dealer_hand_20)
			expect(eval_first_hand).to eq(-1)
		end
		it "should return 1 if player isn't busted but dealer is" do
			test_hands(hand_19, dealer_hand_31)
			expect(eval_first_hand).to eq(1)
		end
		it "should return -1 if dealer isn't busted but player is" do
			test_hands(hand_30, dealer_hand_20)
			expect(eval_first_hand).to eq(-1)
		end
	end

	describe "#evaluate_outcomes" do
		before(:each) do
			gc.set_players

			allow(view)
			.to receive(:ask_for_action)
			.and_return('h')
		end
		it "returns an array of hands" do
			expect(gc.evaluate_outcomes.class == Array && gc.play_game[0].class).to eq(Hand)
		end
	end
end