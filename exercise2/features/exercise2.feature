Feature: Play song
  Scenario: Doing a google search for YouTube Music
    Given We are on google home page
    When We type "YouTube music" in search bar
    Then Submit the query

  Scenario: Open YouTube Music and search a song
    Given Click on website with 'YouTube Music' keyword
    When Click on search button on website
    Then We type "Despacito" song on website and search for results

  Scenario: Play the song from the results
    Given Get the "Despacito" song from the results
    Then Click on play button
