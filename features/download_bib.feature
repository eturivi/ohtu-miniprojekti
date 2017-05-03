Feature: As a customer I can download BibTeX file from reference list

  Scenario: Name is not chosen for the all references file
    Given   I am at front page
    When    Filename field is empty
    And     I click "Download all references"
    Then    I should get a download with the filename "all_references.bib"
