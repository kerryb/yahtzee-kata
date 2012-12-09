require "number_count_scorer"

class Scorer
  def initialize *dice
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
                        end
    category_scorer.score *@dice
  end
end
