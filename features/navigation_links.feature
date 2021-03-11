Feature: Navigation links

  Scenario: I don't see the signout link when I'm not logged in
    Given I go to the homepage
    Then I should not see the signout link
    And I should see the signin and signup links

  Scenario: I don't see the signin and signup links when I'm logged in
    Given I'm logged in
    Then I should not see the signin link
    And I should not see the signup link
