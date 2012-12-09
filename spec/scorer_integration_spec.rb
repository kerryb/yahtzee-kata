require "scorer"

RSpec::Matchers.define :score do |*dice|
  match do |actual|
    @score = Scorer.new(*dice).score_as(@category)
    @score == @expected
  end

  chain :in_category do |category|
    @category = category
  end

  chain :as do |expected|
    @expected = expected
  end

  failure_message_for_should do
    "expected #{dice.inspect} in category #{@category.inspect} to score #{@expected}, but got #{@score}"
  end
end

describe "Yahtzee scoring" do
  context "scoring ones" do
    it { should score(2, 2, 3, 4, 5).in_category(:ones).as 0 }
    it { should score(1, 2, 3, 4, 5).in_category(:ones).as 1 }
    it { should score(1, 1, 3, 4, 5).in_category(:ones).as 2 }
    it { should score(5, 1, 4, 1, 1).in_category(:ones).as 3 }
    it { should score(6, 1, 1, 1, 1).in_category(:ones).as 4 }
    it { should score(1, 1, 1, 1, 1).in_category(:ones).as 5 }
  end

  context "scoring twos" do
    it { should score(1, 2, 3, 4, 5).in_category(:twos).as 2 }
    it { should score(1, 2, 2, 4, 5).in_category(:twos).as 4 }
  end

  context "scoring threes" do
    it { should score(1, 2, 3, 4, 5).in_category(:threes).as 3 }
    it { should score(1, 2, 3, 3, 5).in_category(:threes).as 6 }
  end

  context "scoring fours" do
    it { should score(1, 2, 3, 4, 5).in_category(:fours).as 4 }
    it { should score(1, 2, 3, 4, 4).in_category(:fours).as 8 }
  end

  context "scoring fives" do
    it { should score(1, 2, 3, 4, 5).in_category(:fives).as 5 }
    it { should score(1, 2, 3, 5, 5).in_category(:fives).as 10 }
  end

  context "scoring sixes" do
    it { should score(1, 2, 3, 4, 6).in_category(:sixes).as 6 }
    it { should score(1, 2, 3, 6, 6).in_category(:sixes).as 12 }
  end

  context "scoring three of a kind" do
    it { should score(1, 1, 3, 4, 5).in_category(:three_of_a_kind).as 0 }
    it { should score(1, 1, 1, 4, 5).in_category(:three_of_a_kind).as 12 }
    it { should score(5, 6, 6, 6, 6).in_category(:three_of_a_kind).as 29 }
  end

  context "scoring four of a kind" do
    it { should score(1, 1, 1, 4, 5).in_category(:four_of_a_kind).as 0 }
    it { should score(1, 1, 1, 1, 5).in_category(:four_of_a_kind).as 9 }
    it { should score(6, 6, 6, 6, 6).in_category(:four_of_a_kind).as 30 }
  end

  context "scoring full house" do
    it { should score(1, 1, 3, 1, 1).in_category(:full_house).as 0 }
    it { should score(2, 2, 6, 6, 6).in_category(:full_house).as 25 }
    it { should score(2, 2, 2, 2, 2).in_category(:full_house).as 25 }
  end

  context "scoring yahtzee" do
    it { should score(1, 1, 3, 1, 1).in_category(:yahtzee).as 0 }
    it { should score(6, 6, 6, 6, 6).in_category(:yahtzee).as 30 }
  end

  it "fails if given less than five dice" do
    expect { Scorer.new(1, 2, 3, 4) }.to raise_error Scorer::WrongNumberOfDice
  end

  it "fails if given more than five dice" do
    expect { Scorer.new(1, 2, 3, 4, 5, 6) }.to raise_error Scorer::WrongNumberOfDice
  end

  it "fails if given an invalid category" do
    expect { Scorer.new(1, 2, 3, 4, 5).score_as(:foo) }.to raise_error Scorer::InvalidCategory
  end
end
