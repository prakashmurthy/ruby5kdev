Feature: Editing own profile
  In order to change my profile details
  As a user
  I want to be able to modify them through the backend

  Background:
    Given there are the following users:
      | email                | password | admin | first_name | last_name |
      | user@ruby5k.in       | password | false | Ruby       | Tuesday   |
    And I am logged in as "user@ruby5k.in"
    And I am on the homepage
    And I follow "Signed in as user@ruby5k.in"

  Scenario: Changing first name from Ruby to Python
    And I follow "Edit Profile"
    And I fill in "First name" with "Python"
    And I press "Save"
    Then I should see "Python Tuesday's profile on Ruby5K.in"

  Scenario: Changing password
    And I follow "Change password"
    And I fill in password with "newpassword"
    And I fill in password confirmation with "newpassword"
    And I fill in "Current password" with "password"
    And I press "Update"
    Then I should see "You updated your account successfully"
