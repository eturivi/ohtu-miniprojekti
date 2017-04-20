Feature: As a customer I can add an article-type reference

  Scenario: new article is added with valid information
    Given new article is selected
    When  author "emlai", title "#yolo", year "666", journal "Foo", volume "1" are given
    Then  article is added

  Scenario: Scandics are working
    Given new article is selected
    When  author "Åke Ö Ääöå", title "ÅåÖöÄä", year "2018", journal "Bar", volume "1" are given
    Then  article is added
    And   scandics are shown properly

  Scenario: adding a new article fails due to invalid author
    Given new article is selected
    When  author "", title "#yolo", year "666", journal "Foo", volume "1" are given
    Then  article is not added and error message is given

  Scenario: adding a new article fails due to invalid title
    Given new article is selected
    When  author "emlai", title "", year "666", journal "Foo", volume "1" are given
    Then  article is not added and error message is given

  Scenario: adding a new article fails due to invalid year
    Given new article is selected
    When  author "emlai", title "#yolo", year "", journal "Foo", volume "1" are given
    Then  article is not added and error message is given

  Scenario: adding a new article fails due to invalid journal
    Given new article is selected
    When  author "emlai", title "#yolo", year "666", journal "", volume "1" are given
    Then  article is not added and error message is given

  Scenario: adding a new article fails due to invalid volume
    Given new article is selected
    When  author "emlai", title "#yolo", year "666", journal "Foo", volume "" are given
    Then  article is not added and error message is given
