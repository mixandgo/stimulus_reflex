@javascript
Feature: User signup

  Scenario: I can create an account
    Given I am on the homepage
    When I sign up for a new account
    Then I should see a welcome message
