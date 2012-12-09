require "scorer"

RSpec::Matchers.define :score do |*dice|
  match do |actual|
    Scorer.new(*dice).score_as(@category) == @expected
  end

  chain :in_category do |category|
    @category = category
  end

  chain :as do |expected|
    @expected = expected
  end

  failure_message_for_should do |actual|
    "expected #{dice.inspect} in category #{@category.inspect} to score #{@expected}, but got #{actual}"
  end
end

describe Scorer do
  context "scoring ones" do
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
end
