require_relative "../../models/deck"

describe "Deck" do

	let(:deck) { Deck.new }

	describe "#playable_cards" do
		it "A new deck starts with 52 cards" do
			expect(deck.playable_cards.size).to eq(52)
		end
	end
	describe "#deal_card" do
		it "should successfully remove a particular card from the deck" do
			card = deck.deal_card
			expect(deck.playable_cards.include?(card)).to eq(false)
		end
		it "should leave the deck containing one fewer cards" do
			3.times { deck.deal_card }
			expect(deck.playable_cards.size).to eq(49)
		end
	end
	describe "#shuffle" do
		it "should change the order of the cards" do
			shuffled = deck.shuffle
			expect(deck).not_to eq(shuffled)
		end
		it "should keep the deck the same size" do
			deck.shuffle
			expect(deck.playable_cards.size).to eq(52)
		end

	end
end