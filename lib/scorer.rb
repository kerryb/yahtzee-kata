class Scorer
  def initialize *dice
    @dice = dice
  end

  def score_as category
    if category == :ones
      @dice.count(1)
    else
      @dice.count(2) * 2
    end
  end
end
