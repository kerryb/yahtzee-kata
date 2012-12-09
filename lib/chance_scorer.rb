class ChanceScorer
  def score *dice
    dice.inject &:+
  end
end
