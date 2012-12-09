class NumberCountScorer
  def initialize number
    @number = number
  end

  def score *dice
    dice.count(@number) * @number
  end
end
