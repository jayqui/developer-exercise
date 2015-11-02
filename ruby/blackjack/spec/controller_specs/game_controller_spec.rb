require_relative "../../controllers/game.rb"

describe "GameController" do

	let(:gc) { GameController.new }
	let(:view) { GameView.new }
	
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
				allow(view)
				.to receive(:ask_for_action)
				.and_return('h')

				gc.set_players
				hand = gc.round.hands[0]
				turn = Turn.new(hand, gc.round)
				gc.handle_player_actions(turn)
			end

			it "should increase the card count by one one for each hit" do
				expect(gc.round.hands[0].cards.count).to be > 2
			end
			it "should hit until a bust" do
				expect(gc.round.hands[0].is_busted).to be true
			end
		end
		context "when hand is a blackjack" do
			
		end
	end

	# xdescribe "#play_game" do
	# 	it "does stuff" do
	# 		gc.set_players
	# 		expect(gc.play_game).to eq('hi')
	# 	end
	# end
end