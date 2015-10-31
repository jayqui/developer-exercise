require_relative "../../models/hand"

describe "Hand" do

	let(:player) { Player.new("James") }
	let(:hand_1) { Hand.new(player, Card.new(:spades, :king, 10), Card.new(:diamonds, :six, 6)) }
	let(:hand_2) { Hand.new(player, Card.new(:spades, :ace, [1,11]), Card.new(:diamonds, :six, 6)) }
	let(:hand_3) { Hand.new(player, Card.new(:hearts, :six, 6), Card.new(:diamonds, :king, 10), Card.new(:spades, :ace, [1,11])) }
	let(:hand_4) { Hand.new(player, Card.new(:spades, :ace, [1,11]), Card.new(:hearts, :ace, [1,11]), Card.new(:hearts, :six, 6), Card.new(:diamonds, :king, 10), ) }
	let(:four_aces_and_six_hand) { Hand.new(player, Card.new(:spades, :ace, [1,11]), Card.new(:hearts, :ace, [1,11]), Card.new(:diamonds, :ace, [1,11]), Card.new(:clubs, :ace, [1,11]), Card.new(:hearts, :six, 6))  }
	let(:blackjack_hand) { Hand.new(player, Card.new(:spades, :ace, [1,11]), Card.new(:hearts, :ten, 10)) }
	let(:hand_21) { Hand.new(player, Card.new(:spades, :ace, [1,11]), Card.new(:hearts, :eight, 8), Card.new(:hearts, :two, 2)) }

	describe "#score" do
		context "hand with no aces" do
			it "should correctly calculate the score" do
				expect(hand_1.score).to eq(16)
			end
		end
		context "hand with aces" do
			it "should provide an array for two possible scores" do
				expect(hand_2.score).to eq([7,17])
			end
			it "should provide an array for three possible scores" do
				expect(hand_4.score).to eq([18,28,38])
			end
			it "should work even with four aces" do
				expect(four_aces_and_six_hand.score).to eq([10, 20, 30, 40, 50])
			end
		end
	end

	describe "#is_blackjack?" do
		context "when a hand is a blackjack" do
			it "should return true if a hand is a blackjack" do
				expect(blackjack_hand.is_blackjack?).to eq(true)
			end
			it "should assign an instance variable" do
				expect(blackjack_hand.is_blackjack).to eq(true)
			end
		end
		context "when a hand is not a blackjack" do
			it "should return nil if a hand is a blackjack" do
				expect(hand_1.is_blackjack?).to eq(nil)
			end
			it "should not have the instance variable" do
				expect(hand_1.is_blackjack).to eq(nil)
			end
		end
		context "when a hand adds to 21 but is more than 2 cards" do
			it "should return nil if a hand is a blackjack" do
				expect(hand_21.is_blackjack?).to eq(nil)
			end
			it "should not have the instance variable" do
				expect(hand_21.is_blackjack).to eq(nil)
			end
		end
	end

		# SPEC TESTS FOR PRIVATE METHODS

	# describe "#number_of_aces" do
	# 	it "should count two where two aces" do
	# 		expect(hand_1.number_of_aces).to eq(0)
	# 	end
	# 	it "should count one where one ace" do
	# 		expect(hand_3.number_of_aces).to eq(1)
	# 	end
	# 	it "should count two where two aces" do
	# 		expect(hand_4.number_of_aces).to eq(2)
	# 	end
	# end

	# describe "#aces" do
	# 	it "should return only the aces" do
	# 		aces = hand_4.aces
	# 		expect(aces.map {|card| card.name }).to eq([:ace, :ace])
	# 	end
	# end

	# describe "#ace_sums" do
	# 	it "should provide the ace sums for a hand with multiple aces" do
	# 		expect(four_aces_and_six_hand.ace_sums).to eq([4,14,24,34,44])
	# 	end
	# end

	# describe "#cards_other_than_aces" do
	# 	it "should return everything except the aces" do
	# 		non_aces = hand_4.cards_other_than_aces
	# 		expect(non_aces.map {|card| card.name }.include?(:ace)).to eq(false)
	# 	end
	# end
end