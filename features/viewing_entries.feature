Feature: Viewing entries
  In order to view all the training entries everyone is creating
  As a user
  I want to see all of them in a page

  Scenario:
    Given there are the following entries:
      | distance | time | location | description |
      | 7        | 65   | statium  | Awesome!    |
      | 5        | 61   | lake     | Not bad     |
      | 13.1     | 119  | Half Marathon | Yay! Below 2 hours |
    And I am on the homepage
    Then I should see "Awesome!"
    And I should see "Not bad"
    And I should see "Yay! Below 2 hours"
