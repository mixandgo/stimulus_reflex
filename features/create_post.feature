Feature: Create post

  Scenario: I can create a post
    Given I'm logged in
    When I create a new post
    Then I should see my post on the timeline
