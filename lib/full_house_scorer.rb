class FullHouseScorer
  def score *dice
    pair_and_three?(dice) || all_same?(dice) ? 25 : 0
  end

  private

  def pair_and_three? dice
    dice.uniq.map{|value| dice.count(value) }.sort == [2, 3]
  end

  def all_same? dice
    dice.uniq.size == 1
  end
end
