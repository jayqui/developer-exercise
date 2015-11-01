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

	xdescribe "#play_game" do
		it "does stuff" do
			gc.set_players
			expect(gc.play_game).to eq('hi')
		end
	end
end