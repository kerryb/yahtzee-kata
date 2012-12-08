module GetsScoreForThrow
  def throw_dice *dice
  end

  def enter_score_in_category category
  end

  def score
  end
end
World GetsScoreForThrow

When "I throw 1 2 3 4 5" do
  throw_dice 1, 2, 3 , 4, 5
end

When 'I choose a category of "ones"' do
  enter_score_in_category :ones
end

Then "my score should be 1" do
  expect(score).to eq 1
end
