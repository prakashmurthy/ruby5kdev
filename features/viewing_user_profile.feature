Feature: Viewing user profile
  In order to know about other users in the system
  As a user
  I want to be able to see their details from their profile page

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

  Scenario: Viewing other user's profile
    And I follow "Gruelling run. Terrific event"
    And I follow "Jane Fonda"
    Then I should see "Jane Fonda's profile on Ruby5K.in"

  Scenario: Viewing own profile
    And I follow "Signed in as bill@ruby5k.in"
    Then I should see "Bill Tucker's profile on Ruby5K.in"
    
