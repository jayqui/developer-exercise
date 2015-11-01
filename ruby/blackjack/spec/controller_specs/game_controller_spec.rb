require_relative "../../controllers/game.rb"

describe "GameController" do

	let(:gc) { GameController.new }

	describe "set_players" do
		before do
      io_obj = double
      expect(gc)
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

		it "should return a valid round" do
			expect(gc.set_players).to be_a(Round)
		end
	end
end