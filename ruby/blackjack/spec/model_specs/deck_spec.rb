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

	describe "#deal_ace" do
		it "should successfully remove a particular card from the deck" do
			card = deck.deal_ace
			expect(deck.playable_cards.include?(card)).to eq(false)
		end
		it "should be an ace" do
			card = deck.deal_ace
			expect(card.name).to eq(:ace)
		end
		context "when multiple aces are taken out" do
			before(:each) do
				4.times { deck.deal_ace }
			end
			it "should take four aces from the deck" do
				expect(deck.playable_cards.size).to eq(48)
			end
			it "should leave the deck devoid of aces after all originals are removed" do
				expect(deck.playable_cards.any? {|card| card.name == :ace })
			end
			it "should return nil if there are no aces left" do
				card = deck.deal_ace
				expect(card).to eq(nil)
			end
		end
	end

	describe "#deal_10_value_card" do
		it "should successfully remove a particular card from the deck" do
			card = deck.deal_10_value_card
			expect(deck.playable_cards.include?(card)).to eq(false)
		end
		it "should be worth ten points" do
			card = deck.deal_10_value_card
			expect(card.value).to eq(10)
		end
		context "when multiple 10-point cards are taken out" do
			before(:each) do
				16.times { deck.deal_10_value_card }
			end
			it "should take four aces from the deck" do
				expect(deck.playable_cards.size).to eq(36)
			end
			it "should leave the deck devoid of aces after all originals are removed" do
				expect(deck.playable_cards.any? {|card| card.name == :ace })
			end
			it "should return nil if there are no aces left" do
				card = deck.deal_10_value_card
				expect(card).to eq(nil)
			end
		end
	end
end