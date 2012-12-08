require "scorer"

describe Scorer do
  context "scoring ones" do
    it "scores one 1 as 1" do
      expect(Scorer.new(1, 2, 3, 4, 5).score_as(:ones)).to eq 1
    end
  end
end
