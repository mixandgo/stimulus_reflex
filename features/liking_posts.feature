Feature: Liking posts

  Scenario: I can like a post
    Given I've created a new post
    When I like the post
    Then the like icon should be enabled
    And I the number of likes should change
