require 'watir-webdriver'
require 'page-object'
require 'selenium-webdriver'

class LoginPage
  include PageObject
  attr_accessor :visit_page

  URLS = {:production => "https://www.google.com/"}

  def initialize(browser)
    @browser = browser
  end

  def method_missing(sym, *args, &block)
    @browser.send sym, *args, &block
  end
  def visit
    @therap_login_url = @browser.goto URLS['production']
  end
end

=begin
  page_url @browser.Common.get_url('login')
  @browser.text_field(:id => 'loginName')
  text_field :password, :id => 'password'
  text_field :providerCode, :id => 'providerCode'
  button :login_form, :name => 'submitButton'

  def login(login_user, pass,code)
    self.loginName = login_user
    self.password = pass
    self.providerCode = code
    self.login_form_element.submit
  end
=end