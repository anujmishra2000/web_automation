require 'selenium-webdriver'
require 'page-object'

BeforeAll do |scenario|
    sleep 4
    $browser = Selenium::WebDriver.for :chrome
    $browser.manage.timeouts.implicit_wait = 20
    sleep 5
end

AfterAll do |scenario|
    sleep 2
    $browser.quit
end
