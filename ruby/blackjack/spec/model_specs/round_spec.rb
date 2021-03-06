require_relative "../../models/round"

describe "Round" do

	let(:alice) { Player.new("Alice")}
	let(:ben) { Player.new("Ben")}
	let(:round) { Round.new([alice, ben]) }

	describe "the round" do
		it "each player should start with two cards" do
			round.hands.each do |hand|
				expect(hand.cards.count).to eq(2)
			end
		end
	end
end