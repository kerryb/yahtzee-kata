require "of_a_kind_scorer"

describe OfAKindScorer do
  it "scores zero when there are not enough of any number" do
    expect(OfAKindScorer.new(3).score(1, 1, 3, 4, 4)).to eq 0
  end

  it "scores the sum of all dice when there are exactly n numbers the same" do
    expect(OfAKindScorer.new(3).score(1, 2, 4, 4, 4)).to eq 15
  end

  it "scores the sum of all dice when there are more than n numbers the same" do
    expect(OfAKindScorer.new(3).score(4, 2, 4, 4, 4)).to eq 18
  end
end
