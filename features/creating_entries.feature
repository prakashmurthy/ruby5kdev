Feature: Creating entries
  In order to create new entries
  As a user
  I want to be able to do so from the main page

  Background:
    Given I am on the homepage
    And I press "New Entry"

  Scenario: creating an entry
    And I fill in "Distance" with "5"
    And I fill in "Time" with "29"
    And I fill in "Location" with "Kukkarahalli Kere"
    And I fill in "Description" with "Good run today!"
    And I press "Share"
    Then I should see "Training has been successfully posted"

  Scenario: entry with just distance should be valid
    And I fill in "Distance" with "5"
    And I press "Share"
    Then I should see "Training has been successfully posted"

  Scenario: entry without distance should be invalid
    And I fill in "Distance" with ""
    And I fill in "Time" with "29"
    And I fill in "Location" with "Kukkarahalli Kere"
    And I fill in "Description" with "Good run today!"
    And I press "Share"
    #Then I should see "Training has not been posted"
    Then I should see "Distance can't be blank"
