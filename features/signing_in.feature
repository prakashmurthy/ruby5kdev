Feature: Signing in
  In order to use the system
  As a user
  I want to be able to sign in

  Scenario: Signing via confirmation
    Given there are the following users:
      | email             | password | unconfirmed | 
      | user@ruby5k.in    | password | true        |
    And "user@ruby5k.in" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    Then I should see "Your account was successfully confirmed"
    And I should see "Signed in as user@ruby5k.in"

  Scenario: Signing in via form for regular user
    Given there are the following users:
      | email             | password | unconfirmed | admin |
      | user@ruby5k.in    | password | false       | false |
    And I am signed in as them
    Then I should see "Signed in as user@ruby5k.in"
    And I should not see "Admin"

  Scenario: Signing in via form for admin user
    Given there are the following users:
      | email             | password | unconfirmed | admin |
      | admin@ruby5k.in   | password | false       | true  |
    And I am signed in as them
    Then I should see "Signed in as admin@ruby5k.in"
    And I should see "Admin"
