Feature: Viewing users 
  To know about the various users in the system
  As an admin
  I should see the list of users

  Background: 
    Given there are the following users:
      | email             | password | unconfirmed | admin | first_name | last_name |
      | admin@ruby5k.in   | password | false       | true  | Admin      | User      |
      | user@ruby5k.in    | password | false       | false | Vincent    | Vega      |

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
    And I should see "Vincent Vega"
