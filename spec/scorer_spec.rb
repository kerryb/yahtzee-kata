require "scorer"

describe Scorer do
  describe "#score" do
    let(:scorer) { stub }

    before { scorer.stub(:score).with(1, 2, 3, 4, 5) { 42 } }

    it "scores ones using a number count scorer" do
      NumberCountScorer.stub(:new).with(1) { scorer }
      expect(Scorer.new(1, 2, 3, 4, 5).score_as(:ones)).to eq 42
    end

    it "scores twos using a number count scorer" do
      NumberCountScorer.stub(:new).with(2) { scorer }
      expect(Scorer.new(1, 2, 3, 4, 5).score_as(:twos)).to eq 42
    end
  end
end
