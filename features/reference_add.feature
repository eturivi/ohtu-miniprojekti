Feature: Add reference

  Scenario: I can submit article reference and it is added
    Given I am at articles/new
    And   I have filled in author as "emlai", title as "#yolo", year as "666"
    When  I click "Create Article"
    Then  front page has content "emlai" and "#yolo" and "666"

  Scenario: Scandics are working
    Given I am at articles/new  
    And   I have filled in author as "Åke Ö Ääöå", title as "ÅåÖöÄä", year as "2018"
    When  I click "Create Article"
    Then  front page has content "Åke Ö Ääöå" and "ÅåÖöÄä" and "666"
