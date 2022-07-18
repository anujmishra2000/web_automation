class YouTubeMusicSearchPage
  include PageObject
  text_field(:search_box, :class => 'ytmusic-search-box')
  def visit_site
    begin
      navigate_to 'https://music.youtube.com/'
      $browser.switch_to.alert.accept
    rescue Selenium::WebDriver::Error::NoSuchAlertError
      puts
    end
      sleep 2
  end

  def search_for(search_key)
      self.search_box = search_key
      sleep 2
      find_elements(:class, 'ytmusic-search-box')[4].send_key(:enter)
      sleep 2
  end

  def click_search_button
    $browser.find_elements(:class,  'tp-yt-paper-icon-button')[0].click
    sleep 2
  end

  def play_song(song_name)
    $browser.find_element(:link_text, song_name).click
    sleep 10
  end
end