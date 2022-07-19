require_relative '../pages/music_home_page.rb'

Given(/^Go to website of YouTube Music$/) do
    $music_page = YouTubeMusicSearchPage.new
    $music_page.load
end 

When("Play {string} song on website from search results") do |keyword|
    $music_page.click_search_button
    $music_page.search_for(keyword)
    $music_page.click_search_button
    $music_page.play_song(keyword)
end
