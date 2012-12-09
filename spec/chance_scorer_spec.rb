require "chance_scorer"

describe ChanceScorer do
  it "scores the sum of all dice" do
    expect(ChanceScorer.new.score(1, 2, 4, 6, 3)).to eq 16
  end
end
