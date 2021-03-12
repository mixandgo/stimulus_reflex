@javascript
Feature: Post comment

  Scenario: I can post a comment
    Given I've created a new post
    When I add a comment to the post
    Then I should see my own comment

  Scenario: Others can see my comments in real time
    Given I've created a new post
    And someone else watches my post
    When I add a comment to the post
    Then the other person sees my comment without reloading the page
