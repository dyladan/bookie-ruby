Feature: Bmark
    I want to grab recent bookmarks

    Scenario: Most recent bookmark
        When I run "bookie dyladan"
        Then the output should contain "Url"