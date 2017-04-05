Feature: Add reference

  Scenario: I can submit article reference and it is added
    Given I am at articles/new    
    And   Author is filled in with "emlai"
    And   Title is filled in with "#yolo"
    And   Year is filled in with "666"
    When  I click "Create Article"
    Then  page "/" has content "emlai"
    And   page "/" has content "#yolo"
    And   page "/" has content "666"

  Scenario: Scandics are working
    Given I am at articles/new  
    And   Author is filled in with "Åke Ö Ääöå"
    And   Title is filled in with "ÅåÖöÄä"
    And   Year is filled in with "666"
    When  I click "Create Article"
    Then  page "/" has content "Åke Ö Ääöå"
    And   page "/" has content "ÅåÖöÄä"
    And   page "/" has content "666"
