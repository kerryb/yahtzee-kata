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
  end

  context "scoring twos" do
    it { should score(1, 2, 3, 4, 5).in_category(:twos).as 2 }
    it { should score(1, 2, 2, 4, 5).in_category(:twos).as 4 }
  end
end
