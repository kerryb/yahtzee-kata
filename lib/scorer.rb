class Scorer
  def initialize *dice
    @dice = dice
  end

  def score_as category
    @dice.count(1)
  end
end
