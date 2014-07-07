require 'watir-webdriver'
require 'page-object'
require './features/support/env'

class TestLoginPage
  include PageObject
  attr_accessor :visit_page

  def initialize(browser)
    @browser = browser
  end

  def visit
    @browser.goto URL[:devel]
  end

  def login_name=(name)
    @browser.text_field(:id => 'loginName').set(name)
  end

  def login_password=(password)
    @browser.text_field(:id => 'password').set(password)
  end

  def login_code=(code)
    @browser.text_field(:id => 'providerCode').set(code)
  end

  def login_button
    @browser.button(:name => 'submitButton').click
  end

  def agree_button=(agree)
    if @browser.button(:name => agree).exists?
      browser.button(:name => 'agree').click
    end
  end

end