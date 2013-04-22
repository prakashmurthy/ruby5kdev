Feature: Viewing users 
  To know about the various users in the system
  As an admin
  I should see the list of users

  Scenario: Viewing users from admin link
    Given there are the following users:
      | email             | password | unconfirmed | admin |
      | admin@ruby5k.in   | password | false       | true  |
      | user@ruby5k.in    | password | false       | false |
    And I am signed in as "admin@ruby5k.in"
    Then I should see "Signed in as admin@ruby5k.in"
    And I follow "Admin"
    And I follow "Users"
    Then I should see "Users List"
    And I should see "user@ruby5k.in"
