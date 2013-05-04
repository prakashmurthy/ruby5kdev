Feature: Creating comments on an entry
  In order to encourage runners
  As a user
  I want to be able to comment on their training entry

  Background: 
    Given there are the following users:
      | email            | password | first_name | last_name |
      | ashis.roy@12.com | password | Ashis      | Roy       |
      | prakash@12.com   | password | Prakash    | Murthy    |
    And I am signed in as "prakash@12.com"
    And "ashis.roy@12.com" has created the following entries:
      | distance | time | location | description |
      | 42       | 200  | Boston   | Finished Boston Marathon very thrilled  |
      | 3        | 20   | Near home| First run after the marathon last Sunday  |
    And I am on the homepage

  Scenario: creating a comment from the entry show page
    And I follow "Finished Boston Marathon very thrilled"
    And I fill in "Text" with "Great effort, Sir! You are an inspiration!!"
    And I press "Create Comment"
    Then I should see "Comment has been created"
    And I should see "Great effort, Sir! You are an inspiration!!" 
    And I follow "Sign out"
    And I follow "Finished Boston Marathon very thrilled"
    Then I should see "Great effort, Sir! You are an inspiration!!" 

  Scenario: creating an invalid comment
    And I follow "Finished Boston Marathon very thrilled"
    And I press "Create Comment"
    Then I should see "Comment has not been created"
    And I should see "Text can't be blank" 
