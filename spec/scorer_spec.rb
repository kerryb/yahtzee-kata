require "scorer"

describe Scorer do
  describe "#score" do
    let(:scorer) { stub }

    before { scorer.stub(:score).with(1, 2, 3, 4, 5) { 42 } }

    {ones: 1, twos: 2, threes: 3, fours: 4, fives: 5, sixes: 6}.each do |category, number|
      it "scores #{category} using a number count scorer" do
        NumberCountScorer.stub(:new).with(number) { scorer }
        expect(Scorer.new(1, 2, 3, 4, 5).score_as(category)).to eq 42
      end
    end
  end
end
