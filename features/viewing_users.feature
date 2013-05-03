Feature: Viewing users 
  To know about the various users in the system
  As an admin
  I should see the list of users

  Scenario: Viewing users from admin link
    Given there are the following users:
      | email             | password | unconfirmed | admin | first_name | last_name |
      | admin@ruby5k.in   | password | false       | true  | Admin      | User      |
      | user@ruby5k.in    | password | false       | false | Vincent    | Vega      |
    And I am signed in as "admin@ruby5k.in"
    Then I should see "Signed in as admin@ruby5k.in"
    And I follow "Admin"
    And I follow "Users"
    Then I should see "Users List"
    When I follow "user@ruby5k.in"
    Then I should see "Vincent Vega's profile on Ruby5K.in"
