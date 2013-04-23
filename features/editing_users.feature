Feature: Editing a user
  In order to change a user's details
  As an admin
  I want to be able to modify them through the backend

  Background:
    Given there are the following users:
      | email                | password | admin |
      | admin@ruby5k.in      | password | true  |
      | user@ruby5k.in       | password | true  |
    And I am signed in as "admin@ruby5k.in"
    Given I am on the homepage
    And I follow "Admin"
    And I follow "Users"
    And I follow "user@ruby5k.in"
    And I follow "Edit User"

  Scenario: Updating a user's details
    And I fill in "Email" with "newguy@ruby5k.in"
    And I press "Update User"
    Then I should see "User has been updated."
    And I should see "newguy@ruby5k.in"
    And I should not see "user@ruby5k.in"

  Scenario: Updating with a invalid email fails
    And I fill in "Email" with "XYZ"
    And I press "Update User"
    Then I should see "User has not been updated."
    And I should see "Email is invalid"

  Scenario: Toggling a user's admin ability
    And I check "Is an admin?"
    And I press "Update User"
    Then I should see "User has been updated."
    And I should see "user@ruby5k.in (Admin)"
