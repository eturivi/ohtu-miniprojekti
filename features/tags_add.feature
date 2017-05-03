Feature: As a customer I can add tags to references

  Scenario: Adding tags to an existing reference is successful
    Given   I am viewing the show page of the first reference
    And     Tag "diipadaapa" is not showing
    When    I click "Edit"
    And     I add the tag "diipadaapa"
    Then    Tag "diipadaapa" is showing
