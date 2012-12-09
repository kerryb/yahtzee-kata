require "straight_scorer"

describe StraightScorer do
  it "scores zero when there are not enough consecutive numbers" do
    expect(StraightScorer.new(3, 42).score(1, 2, 5, 5, 6)).to eq 0
  end

  it "scores the defined amount when there are exactly enough consecutive numbers" do
    expect(StraightScorer.new(3, 42).score(1, 2, 6, 3, 1)).to eq 42
  end
end
