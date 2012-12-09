require "number_count_scorer"

class Scorer
  def initialize *dice
    @dice = dice
  end

  def score_as category
    category_scorer = if category == :ones
      NumberCountScorer.new 1
    else
      NumberCountScorer.new 2
    end
    category_scorer.score *@dice
  end
end
