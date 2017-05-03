Feature: filtering references by tags works properly

    Scenario: no references returned when no tags match
        Given I am at front page
    	When references are searched by tag "nomatch"
        Then no references are returned

    Scenario: article type references are included
    	Given new article is selected
        # the 'send help' is required because cucumber and reasons
        When send help author "a", title "b", year "1", journal "c", volume "1", tag "articletag" are given
    	And references are searched by tag "articletag"
        Then reference with type "article" and tag "articletag" is returned

    Scenario: inproceeding type references are included
    	Given new inproceeding is selected
        When  author "a", title "b", booktitle "c" year "1", tag "inproceedingtag" are given
    	And references are searched by tag "inproceedingtag"
        Then reference with type "inproceeding" and tag "inproceedingtag" is returned

    Scenario: book type references are included
    	Given new book is selected
        When  author "a", title "b", publisher "c", year "1", tag "booktag" are given
    	And references are searched by tag "booktag"
        Then reference with type "book" and tag "booktag" is returned

    Scenario: multiple references can be returned
    	Given new article is selected
        When  author "a", title "b", year "1", journal "c", volume "1", tag "mytag" are given
        And new book is selected
        And author "a", title "b", publisher "c", year "1", tag "mytag" are given
        And references are searched by tag "mytag"
        Then reference with type "book" and tag "mytag" is returned
        And  reference with type "article" and tag "mytag" is returned
