Feature: Yahtzee scoring

  Scenario: "ones" scores the sum of the dice that read 1
    When I throw 1 2 3 4 5
    And I choose a category of "ones"
    Then my score should be 1
