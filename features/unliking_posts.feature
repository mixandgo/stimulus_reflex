@javascript
Feature: Unliking posts

  Scenario: I can unlike a post
    Given I've liked my post
    When I unlike my post
    Then the like icon should be disabled
    And I the number of likes should decrease

  Scenario: Others can see unlikes
    Given I've liked my post
    And someone else watches my post
    When I unlike my post
    Then the other person sees the number of likes decrease without reloading the page
