require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome
Given(/^We are on google home page$/) do
  driver.navigate.to 'https://www.google.com'
  sleep(2)
end

When("We type {string} in search bar") do |query|
  @search_box = driver.find_elements(:name, 'q')[0]
  @search_box.send_key(query)
  sleep(1)
end

Then('Submit the query') do
  @search_box.submit
  sleep(3)
end

Given("Click on website with {string} keyword") do |query|
  driver.find_elements(:partial_link_text, query)[0].click
  sleep(3)
end

When('Click on search button on website') do
  driver.find_element(:class,  'tp-yt-paper-icon-button').click
end

Then('We type {string} song on website and search for results') do |query|
  search_song = driver.find_elements(:class, 'ytmusic-search-box')[4]
  search_song.send_key(query)
  sleep(2)
  search_song.send_key(:enter)
  sleep(2)
end

Given('Get the {string} song from the results') do |query|
  @play_song = driver.find_element(:link_text,query)
end

Then('Click on play button') do
  @play_song.click
  sleep(30)
end