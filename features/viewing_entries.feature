Feature: Viewing entries
  In order to view all the training entries everyone is creating
  As a user
  I want to see all of them in a page

  Background:
    Given there are the following users:
      | email            | password |
      | user@ruby5k.in   | password |

  Scenario: Viewing existing entries
    And "user@ruby5k.in" has created the following entries:
      | distance | time | location | description |
      | 7        | 65   | statium  | Awesome!    |
      | 5        | 61   | lake     | Not bad     |
      | 13.1     | 119  | Half Marathon | Yay! Below 2 hours |
    And I am on the homepage
    Then I should see "Awesome!"
    And I should see "Not bad"
    And I should see "Yay! Below 2 hours"
    And within line containing "Not bad" I should not see "Delete"
    And within line containing "Not bad" I should not see "Edit"

  Scenario: Viewing newly created entries
    And "user@ruby5k.in" creates the following entry:
      | distance | time | location    | description     |
      | 10       | 65   | GKVK Campus | Tiring run on a hot day |
    And "user@ruby5k.in" creates the following entry:
      | distance | time | location    | description |
      | 3.5      | 27   | Park Track  | Had fun running |
    And I am on the homepage
    Then "Had fun running" should appear before "Tiring run on a hot day"
