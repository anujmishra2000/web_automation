
Feature: Play song
  Scenario Outline: Open YouTube Music and search a song
    Given Go to website of YouTube Music
    When Play <search_keyword> song on website from search results

  Examples:
  | search_keyword |
  | "Despacito" |
  | "Pasoori" |