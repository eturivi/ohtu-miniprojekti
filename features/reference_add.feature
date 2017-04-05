Feature: Add reference

  Scenario: I can submit article reference
    Given I am at articles/new    
    And   Author is filled in with "emlai"
    And   Title is filled in with "#yolo"
    And   Year is filled in with "666"
    When  I click "Create Article"
    Then  page "/" has content "emlai"
    And   page "/" has content "#yolo"
    And   page "/" has content "666"
