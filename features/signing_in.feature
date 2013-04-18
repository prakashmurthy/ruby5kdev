Feature: Signing in
  In order to use the system
  As a user
  I want to be able to sign in

  Scenario: Signing via confirmation
    Given there are the following users:
      | email             | password |
      | user@ruby5k.in    | password |
    And "user@ruby5k.in" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    Then I should see "Your account was successfully confirmed"
    And I should see "Signed in as user@ruby5k.in"
