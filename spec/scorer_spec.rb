require "scorer"

describe Scorer do
  context "scoring ones" do
    it "scores one 1 as 1" do
      expect(Scorer.new(1, 2, 3, 4, 5).score_as(:ones)).to eq 1
    end

     it "scores two 1s as 2" do
      expect(Scorer.new(1, 1, 3, 4, 5).score_as(:ones)).to eq 2
    end
  end
end
