Feature: Editing entries
  In order to edit an existing entry
  As a user
  I want to be able to do so easily from the gui

  Background:
    Given there are the following entries:
      | distance | time | location | description |
      | 7        | 65   | statium  | Awesome!    |
    And I am on the homepage
    And I follow "Edit"

  Scenario: Edit distance and location
    And I fill in "Distance" with "8"
    And I fill in "Location" with "Stadium"
    And I press "Share"
    Then I should see "8"
    And I should not see "7"
    And I should see "Stadium"
    And I should not see "statium"

  Scenario: Making distance & time blank should be rejected
    And I fill in "Distance" with ""
    And I fill in "Time" with ""
    And I press "Share"
    Then I should see "You must enter distance or time or both"
