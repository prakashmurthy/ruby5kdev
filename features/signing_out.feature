Feature: Signing in
  In order to stop using the site
  As a user
  I want to be able to sign out

  Scenario: Signing out from the form
    Given there are the following users:
      | email               | password | unconfirmed |
      | user@ruby5k.in      | password | false       |
    And I am signed in as them
    When I follow "Sign out"
    Then I should see "Signed out successfully "
