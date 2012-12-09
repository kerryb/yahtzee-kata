require "number_count_scorer"
require "of_a_kind_scorer"
require "full_house_scorer"
require "straight_scorer"

class Scorer
  class WrongNumberOfDice < RuntimeError; end
  class InvalidCategory < RuntimeError; end

  def initialize *dice
    raise WrongNumberOfDice unless dice.size == 5
    @dice = dice
  end

  def score_as category
    category_scorer = case category
                        when :ones then NumberCountScorer.new(1)
                        when :twos then NumberCountScorer.new(2)
                        when :threes then NumberCountScorer.new(3)
                        when :fours then NumberCountScorer.new(4)
                        when :fives then NumberCountScorer.new(5)
                        when :sixes then NumberCountScorer.new(6)
                        when :three_of_a_kind then OfAKindScorer.new(3)
                        when :four_of_a_kind then OfAKindScorer.new(4)
                        when :full_house then FullHouseScorer.new
                        when :low_straight then StraightScorer.new(4, 30)
                        when :high_straight then StraightScorer.new(5, 40)
                        when :yahtzee then OfAKindScorer.new(5)
                        else raise InvalidCategory
                        end
    category_scorer.score *@dice
  end
end
