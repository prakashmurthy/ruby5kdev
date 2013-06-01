Feature: Deleting comments
  In order to delete comments created by me
  As a user
  I want to be able to do so easily

  Background: Delete comment from entry page
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

    Scenario: creating comment and delete it  
      And I follow "Finished Boston Marathon very thrilled"
      And I fill in "Text" with "Great effort, Sir! You are an inspiration!!"
      And I press "Create Comment"
      Then I should see "Comment has been created"
      And I should see "Great effort, Sir! You are an inspiration!!"
      And I follow "Delete"
      Then I should see "Comment has been deleted"
