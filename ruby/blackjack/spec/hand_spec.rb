require_relative "../models/player"
require_relative "../models/card"
require_relative "../models/hand"

describe "Hand" do

	let(:player) { Player.new }
	let(:hand_1) { Hand.new(player, Card.new(:spades, :king, 10), Card.new(:diamonds, :six, 6)) }

	describe "#score" do
		context "hand with no aces" do
			it "should correctly calculate the score" do
				expect(hand_1.score).to eq(16)
			end
		end
		# context "hand with aces" do
		# 	it "should assume aces are high" do
		# 		expect(hand_2.score).to eq(16)
		# 	end
		# end
	end
end