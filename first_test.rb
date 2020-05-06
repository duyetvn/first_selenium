require "selenium-webdriver" # load in the webdriver gem to interact with Selenium
require 'test/unit'
require 'pry'

extend Test::Unit::Assertions
# create a driver object.
# This is what you will actually interact with to do things within the automated
# driver = Selenium::WebDriver.for :firefox

# open CrossBrowserTesting.com inside Chrome
# driver.navigate.to "http://crossbrowsertesting.com"

# find the login button and click it
	# element = driver.find_element(xpath: "//div[@class='nav-cta-set']//a[contains(@class,'login')][@href='/login']")
	# element.click

# driver.quit

class FeatureTest < Test::Unit::TestCase
	def setup
    @driver = Selenium::WebDriver.for :firefox
  end

	# def test_login
	# 	@driver.navigate.to "http://crossbrowsertesting.com"
	# 	element = @driver.find_element(xpath: "//div[@class='nav-cta-set']//a[contains(@class,'login')][@href='/login']")
	# 	element.click

	# 	current_url = @driver.current_url
	# 	assert_equal 'https://app.crossbrowsertesting.com/login', current_url

	# 	@driver.quit
	# end

	def test_content_login_page

		@driver.navigate.to "https://app.crossbrowsertesting.com/login"
		sleep 3
		assert_equal(true, @driver.find_element(xpath: "//input[@name='username']").displayed?)
		assert_equal(true, @driver.find_element(id: "inputPassword").displayed?)

		btn_login = @driver.find_element(xpath: "//button[@ng-click='checkLogin()']")
		assert_equal(true, btn_login.displayed?)
		assert_equal('Log In', btn_login.text())
		assert_equal('Log in to your account', @driver.find_element(xpath: "//div[@id='user-form-well']"))

		@driver.quit
	end

	def test_action_login
		# bla
	end
end
