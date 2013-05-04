Feature: Viewing users 
  To know about the various users in the system
  As an admin
  I should see the list of users

  Background: 
    Given there are the following users:
      | email             | password | unconfirmed | admin | first_name | last_name |
      | admin@ruby5k.in   | password | false       | true  | Admin      | User      |
      | user@ruby5k.in    | password | false       | false | Vincent    | Vega      |
    And "user@ruby5k.in" has created the following entries:
      | distance | time | location | description |
      | 7        | 65   | statium  | Awesome!    |
      | 5        | 61   | lake     | Not bad     |

  Scenario: Viewing users from admin link
    And I am signed in as "admin@ruby5k.in"
    Then I should see "Signed in as admin@ruby5k.in"
    And I follow "Admin"
    And I follow "Users"
    Then I should see "Users List"
    When I follow "user@ruby5k.in"
    Then I should see "Vincent Vega's profile on Ruby5K.in"

  Scenario: Viewing users from the 'runners' link
    When I am on the homepage
    And I follow "Runners"
    Then I should see "Admin User"
    And I follow "Vincent Vega"
    And I should see "Training runs posted by Vincent Vega"
    And I should see "statium"
