require "number_count_scorer"

describe NumberCountScorer do
  it "returns the total score of the dice matching the specified number" do
    expect(NumberCountScorer.new(3).score(1, 2, 3, 3, 5)).to eq 6
  end

  it "returns zero when no dice match" do
    expect(NumberCountScorer.new(1).score(2, 3, 4, 5, 6)).to eq 0
  end
end
