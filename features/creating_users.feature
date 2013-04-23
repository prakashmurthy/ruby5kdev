Feature: Creating Users
  In order to add new users to the system
  As an admin
  I want to be able to add them through the backend

  Background:
    Given there are the following users:
      | email                | password | admin |
      | admin@ruby5k.in      | password | true  |
    And I am signed in as "admin@ruby5k.in"
    Given I am on the homepage
    And I follow "Admin"
    And I follow "Users"
    And I follow "New User"

  Scenario: Creating a new user
    And I fill in "Email" with "newbie@ruby5.in"
    And I fill in "Password" with "password"
    And I press "Create User"
    Then I should see "User has been created."

  Scenario: Leaving email blank would throw an error
    And I fill in "Email" with ""
    And I fill in "Password" with "password"
    And I press "Create User"
    Then I should see "User has not been created."
    And I should see "Email can't be blank"
