Feature: Deleting entries
  In order to delete an existing entry
  As a user
  I want to be able to do so easily form the gui

  Scenario: Delete entry from index page
    Given there are the following entries:
      | distance | time | location | description |
      | 7        | 65   | statium  | Awesome     |
      | 1        | 12   | Lake     | Quick one   |
    And I am on the homepage
    And I delete within line with "Quick one"
    Then I should see "Entry has been deleted"
    And I should not see "Quick one"
    And I should see "Awesome"
