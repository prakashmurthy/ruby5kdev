Feature: Signing up
  In order to be able to add training entries
  As a user
  I want to be able to sign up

  Scenario: Signing up
    Given I am on the homepage
    When I follow "Sign up"
    And I fill in "Email" with "user@ruby5k.com"
    And I fill in password with "password"
    And I fill in password confirmation with "password"
    And I press "Sign up"
    Then I should see "You have signed up successfully"
