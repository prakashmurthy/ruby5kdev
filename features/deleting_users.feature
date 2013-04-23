Feature: Deleting users
  In order to remove users
  As an admin
  I want to click a button and delete them

  Background:
    Given there are the following users:
      | email                | password | admin |
      | admin@ruby5k.in      | password | true  |
      | user@ruby5k.in       | password | true  |
    And I am signed in as "admin@ruby5k.in"
    Given I am on the homepage
    And I follow "Admin"
    And I follow "Users"

  Scenario: Deleting other users
    And I follow "user@ruby5k.in"
    And I follow "Delete User"
    Then I should see "User has been deleted"
    And I should not see "user@ruby5k.in"

  Scenario: I should not be able to delete myself
    And I follow "admin@ruby5k.in (Admin)"
    And I follow "Delete User"
    Then I should see "You cannot delete yourself!"
