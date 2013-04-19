Feature: Editing entries
  In order to edit an existing entry
  As a user
  I want to be able to do so easily from the gui

  Background:
    Given there are the following users:
      | email            | password |
      | user@ruby5k.in   | password |
      | other@ruby5k.in  | password |
    And I am signed in as "user@ruby5k.in"
    And "user@ruby5k.in" has created the following entries:
      | distance | time | location | description |
      | 7        | 65   | statium  | Awesome     |
      | 1        | 12   | Lake     | Quick one   |
    And "other@ruby5k.in" has created the following entries:
      | distance | time | location | description |
      | 3        | 19   | Trials   | Moar speed  |
    And I am on the homepage

  Scenario: Edit distance and location
    And I "Edit" within the line containing "Awesome"
    And I fill in "Distance" with "8"
    And I fill in "Location" with "Stadium"
    And I press "Share"
    Then I should see "8"
    And I should not see "7"
    And I should see "Stadium"
    And I should not see "statium"

  Scenario: Making distance & time blank should be rejected
    And I "Edit" within the line containing "Awesome"
    And I fill in "Distance" with ""
    And I fill in "Time" with ""
    And I press "Share"
    Then I should see "You must enter distance or time or both"

  Scenario: I can't edit other users' entries
    Then within line containing "Moar speed" I should not see "Edit"
