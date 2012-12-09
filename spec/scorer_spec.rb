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

    {three_of_a_kind: 3, four_of_a_kind: 4, yahtzee: 5}.each do |category, number|
      it "scores #{category} using an of-a-kind scorer" do
        OfAKindScorer.stub(:new).with(number) { scorer }
        expect(Scorer.new(1, 2, 3, 4, 5).score_as(category)).to eq 42
      end
    end

    it "scores full house using a full house scorer" do
      FullHouseScorer.stub new: scorer
      expect(Scorer.new(1, 2, 3, 4, 5).score_as(:full_house)).to eq 42
    end
  end
end
