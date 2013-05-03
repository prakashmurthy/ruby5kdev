Feature: Viewing entries
  In order to view all the training entries everyone is creating
  As a user
  I want to see all of them in a page

  Background:
    Given there are the following users:
      | email            | password | first_name | last_name |
      | bill@ruby5k.in   | password | Bill       | Tucker    |
      | jane@fonda.com   | password | Jane       | Fonda     |
    And "bill@ruby5k.in" has created the following entries:
      | distance | time | location | description |
      | 7        | 65   | statium  | Awesome!    |
      | 5        | 61   | lake     | Not bad     |
      | 13.1     | 119  | Half Marathon | Yay! Below 2 hours |
    And "jane@fonda.com" has created the following entries:
      | distance | time | location | description |
      | 123      | 570  | Desert   | Gruelling run. Terrific event|
      | 123      | 570  | Desert   | repeat                       |
    And I am signed in as "bill@ruby5k.in"
    And I am on the homepage


  Scenario: Viewing existing entries
    Then I should see "Awesome!"
    And I should see "Not bad"
    And I should see "Yay! Below 2 hours"
    And within line containing "repeat" I should not see "Delete"
    And within line containing "repeat" I should not see "Edit"

  Scenario: Viewing newly created entries
    And "bill@ruby5k.in" creates the following entry:
      | distance | time | location    | description     |
      | 10       | 65   | GKVK Campus | Tiring run on a hot day |
    And "bill@ruby5k.in" creates the following entry:
      | distance | time | location    | description |
      | 3.5      | 27   | Park Track  | Had fun running |
    And I am on the homepage
    Then "Had fun running" should appear before "Tiring run on a hot day"

  Scenario: Viewing the details of my entry
    When I follow "Yay! Below 2 hours"
    Then I should see "13.1"
    And I should see "Training run by Bill Tucker"
    And I should see "119"
    And I should see "Half Marathon"
    And I should see "Delete"
    And I should see "Edit"

  Scenario: Viewing the details of others' entry
    When I follow "Gruelling run. Terrific event"
    Then I should see "123"
    And I should see "Training run by Jane Fonda"
    And I should see "570"
    And I should see "Desert"
    And I should not see "Delete"
    And I should not see "Edit"
