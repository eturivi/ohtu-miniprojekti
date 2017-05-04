Feature: As a customer I can download BibTeX file from reference list

  Scenario: Downloading the file containing all references with default name
    Given   I am at front page
    When    I click "Download all references"
    Then    I should get a download with the filename "all_references.bib"

  Scenario: Downloading the file containing selected references with default name
    Given   I am at front page
    When    I have selected references
    And     I press "Download all selected references"
    Then    I should get a download with the filename "selected_references.bib"

  Scenario: Downloading the file containing selected references with chosen name
    Given   I am at front page
    When    I have selected references
    And     I have chosen filename "pla.bib"
    And     I press "Download all selected references"
    Then    I should get a download with the filename "pla.bib"
