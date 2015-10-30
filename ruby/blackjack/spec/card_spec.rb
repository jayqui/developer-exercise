require_relative "../models/card"

describe "Card" do

	let(:card) { Card.new(:spades, :ace, [1,11])}
	describe "#suit" do
		it "is correct" do
			expect(card.suit).to eq(:spades)
		end
	end
	describe "#name" do
		it "is correct" do
			expect(card.name).to eq(:ace)
		end
	end
	describe "#value" do
		it "is correct" do
			expect(card.value).to eq([1,11])
		end
	end
end