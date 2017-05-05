Feature: As a customer I can import references from the ACM Digital Library by providing a link

  Scenario: Importing an article succeeds
    Given I am on the ACM import page
    When  I enter the article URL in the text field
    And   I click on the import button
    Then  Article is successfully imported

  Scenario: Importing a book succeeds
    Given I am on the ACM import page
    When  I enter the book URL in the text field
    And   I click on the import button
    Then  Book is successfully imported

  Scenario: Importing a non-ACM URL fails
    Given I am on the ACM import page
    When  I enter the non-ACM URL in the text field
    And   I click on the import button
    Then  I get error message "That's not an ACM Digital Library URL."
