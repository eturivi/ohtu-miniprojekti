Feature: As a customer I can download BibTeX file from reference list

  Scenario: Downloading the file containing all references with default name
    Given   I am at front page
    When    Filename field is empty
    And     I click "Download all references"
    Then    I should get a download with the filename "all_references.bib"

  Scenario: Downloading the file containing selected references with default name
    Given   I am at front page
    When    Filename field is empty
    And     I have selected references
    And     I press "Download selected references"
    Then    I should get a download with the filename "selected_references.bib"
