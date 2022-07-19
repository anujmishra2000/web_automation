class YouTubeMusicSearchPage < SitePrism::Page
  set_url "https://music.youtube.com/"
  element :search_box, :xpath, '/html/body/ytmusic-app/ytmusic-app-layout/ytmusic-nav-bar/div[2]/ytmusic-search-box/div/div[1]/input'
  element :search, :xpath, "/html/body/ytmusic-app/ytmusic-app-layout/ytmusic-nav-bar/div[2]/ytmusic-search-box/div/div[1]/tp-yt-paper-icon-button[1]/tp-yt-iron-icon"
  element :play_button
  # def visit_site
  #   begin
  #     $browser.switch_to.alert.accept
  #   rescue Selenium::WebDriver::Error::NoSuchAlertError
  #     puts
  #   end
  #     sleep 2
  # end

  def search_for(search_key)
      search_box.set search_key
      sleep 2
      search_box.native.send_key(:enter)
      sleep 2
  end

  def click_search_button
    search.click
    sleep 2
  end

  def play_song(song_name)
    self.page.driver.browser.find_element(:link_text, song_name).click
    sleep 10
  end
end