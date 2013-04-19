Feature: Deleting entries
  In order to delete an existing entry
  As a user
  I want to be able to do so easily form the gui

  Background: Delete entry from index page
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

  Scenario: I can delete my entries
    And I "Delete" within the line containing "Quick one"
    Then I should see "Entry has been deleted"
    And I should not see "Quick one"
    And I should see "Awesome"
    And I should see "Moar speed"

  Scenario: I can't delete others' entries
    Then within line containing "Moar speed" I should not see "Delete" 
