Feature: Signing up
  In order to be able to add training entries
  As a user
  I want to be able to sign up

  Scenario: Signing up
    Given I am on the homepage
    When I click on "Sign up"
    And I fill in "Email" with "user@ruby5k.com"
    And I fill in password with "password"
    And I fill in password confirmation with "password"
    And I choose "no" for "running_in_pune" radio button
    And I choose "2" for "runner_level" radio button
    And I choose "1" for "runner_goal" radio button
    And I press "Sign up"
    Then I should see "A message with a confirmation link has been sent to your email address."
