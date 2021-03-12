@javascript
Feature: Create post

  Scenario: I can create a post
    Given I'm logged in
    When I create a new post
    Then I should see my post on the timeline

  Scenario: New posts are broadcasted to all users
    Given I'm logged in
    And I open a second browser window
    When I create a new post
    Then I can see the post in the second window without reload
