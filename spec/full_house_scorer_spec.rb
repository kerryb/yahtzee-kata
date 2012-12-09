require "full_house_scorer"

describe FullHouseScorer do
  it "scores zero when there is not a full house" do
    expect(FullHouseScorer.new.score(1, 4, 4, 4, 4)).to eq 0
  end

  it "scores 25 for a full house" do
    expect(FullHouseScorer.new.score(1, 1, 1, 4, 4)).to eq 25
  end

  it "counts a yahtzee as a full house" do
    expect(FullHouseScorer.new.score(1, 1, 1, 1, 1)).to eq 25
  end
end
