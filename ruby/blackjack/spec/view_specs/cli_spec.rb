require_relative "../../views/game/cli"

describe "GameView" do

	let(:view) { GameView.new }
	
	describe "#ask_for_player_names" do
		before do
      io_obj = double
      expect(view)
        .to receive(:gets)
        .and_return(io_obj)
        .at_least(:once)
      expect(io_obj)
        .to receive(:chomp)
        .and_return("Al")
      expect(io_obj)
        .to receive(:chomp)
        .and_return("Bea")
      expect(io_obj)
        .to receive(:chomp)
        .and_return("")
    end

    it "returns an array of player names" do
    	expect(view.ask_for_player_names).to eq(["Al","Bea"])
    end
	end

end