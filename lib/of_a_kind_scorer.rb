class OfAKindScorer
  def initialize count
    @count = count
  end

  def score *dice
    highest_count(dice) >= @count ? dice.inject(&:+) : 0
  end

  private

  def highest_count dice
    dice.uniq.map{|value| dice.count(value) }.max
  end
end
