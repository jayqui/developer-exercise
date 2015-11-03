require_relative 'where'

describe "Array" do
	describe "#where" do

		let(:boris)   { {:name => 'Boris The Blade', :quote => "Heavy is good. Heavy is reliable. If it doesn't work you can always hit them.", :title => 'Snatch', :rank => 4}   }
		let(:charles) { {:name => 'Charles De Mar', :quote => 'Go that way, really fast. If something gets in your way, turn.', :title => 'Better Off Dead', :rank => 3}   }
		let(:wolf)    { {:name => 'The Wolf', :quote => 'I think fast, I talk fast and I need you guys to act fast if you wanna get out of this', :title => 'Pulp Fiction', :rank => 4}   }
		let(:glen)    { {:name => 'Glengarry Glen Ross', :quote => "Put. That coffee. Down. Coffee is for closers only.",  :title => "Blake", :rank => 5}   }

		let(:fixtures) { [boris, charles, wolf, glen]   }

		it "should return an exact match" do
			expect(fixtures.where(:name => 'The Wolf')).to eq([wolf])
		end

		it "should return a partial match" do
			expect(fixtures.where(:title => /^B.*/)).to eq([charles, glen])
		end

		it "should correctly return a query that has multiple exact results" do
			expect(fixtures.where(:rank => 4)).to eq([boris, wolf])
		end

		it "should work when multiple criteria are specified" do
			expect(fixtures.where(:rank => 4, :quote => /get/)).to eq([wolf])
		end

		it "should work with chain calls" do
			expect(fixtures.where(:quote => /if/i).where(:rank => 3)).to eq([charles])
		end
	end
end