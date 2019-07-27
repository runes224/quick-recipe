require 'selenium-webdriver'

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
options.add_argument('--no-sandbox')
options.add_argument('--disable-dev-shm-usage')
driver = Selenium::WebDriver.for :chrome, options: options

driver.get "http://google.com/"
puts driver.title