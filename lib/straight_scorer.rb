class StraightScorer
  def initialize length, score
    @length, @score = length, score
  end

  def score *dice
    enough_consecutive(dice) ? @score : 0
  end

  private

  def enough_consecutive dice
    dice.sort.each_cons(@length).any? {|subset|
      subset.each_cons(2).all? {|(a, b)| b == a + 1 }
    }
  end
end
