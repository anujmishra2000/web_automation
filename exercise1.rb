require 'selenium-webdriver'
class YoutubeSong
  def navigate(driver, url)
    driver.navigate.to url
  end

  def get_element(driver, type, value)
    driver.find_elements(type, value)
  end

  def command(element, message)
    element.send_key(message)
  end

  def sign_in(button)
    button.click
  end

  def youtube_search(search)
    driver = Selenium::WebDriver.for :chrome
    navigate(driver, "https://music.youtube.com/")
    sleep(5)
    btn = get_element(driver, :class,  'tp-yt-paper-icon-button')[0]
    btn.click
    search_song = get_element(driver, :class, 'ytmusic-search-box')[4]
    search_song.send_key(search)
    sleep(1)
    search_song.send_key(:enter)
    sleep(5)
    play_song = driver.find_element(:link_text,REGEX_SONG)
    play_song.click
    sleep(20)
    puts "Song is playing in Youtube Music"
  end
end

str = "Despacito"
REGEX_SONG = str.freeze
YoutubeSong.new.youtube_search(str)