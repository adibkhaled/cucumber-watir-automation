require 'watir-webdriver'
require 'page-object'
=begin
require 'watir-webdriver'
require 'E:\therap\Test-automation\Therap_automation\features\support\env'
require 'page-object'
PAGE_URL = '/ma/auth'
USERS_FILE_PATH = 'E:\therap\Test-automation\Therap_automation\features\step_definations\login_info.csv'


class LoginPage
  include PageObject  
  
  
  @browser = Watir::Browser.new
  @browser.goto URL[:devel]+PAGE_URL
  @browser.text_field(:loginName,:id => "loginName")
  @browser.text_field(:password,:id => "password")
  @browser.text_field(:providerCode,:id => "providerCode")
  @browser.button(:login, :name => "submitButton")
 

File.open(USERS_FILE_PATH) do |file|
   while line = file.gets
      @browser.text_field(:id => 'loginName').set(line.split(',')[0])
      @browser.text_field(:id => 'password').set(line.split(',')[1]) 
      @browser.text_field(:id => 'providerCode').set(line.split(',')[2])
     @browser.button(:name => 'submitButton').click
end


  def visit
    @browser.goto URL[:production]+PAGE_URL
  end  
  

 def login_with(loginName,password,providerCode)
     self.loginName =loginName
     self.password  = password
     self.providerCode = providerCode   
     login
    end
  end
end
=end

File.open(USERS_FILE_PATH) do |file|
   while line = file.gets
      @browser.text_field(:id => 'loginName').set(line.split(',')[0])
      @browser.text_field(:id => 'password').set(line.split(',')[1]) 
      @browser.text_field(:id => 'providerCode').set(line.split(',')[2])
      login= @browser.button :name => 'submitButton'
      login.exists?
      login.click

      while @browser.button(:name => 'agree').exists?
      @browser.button(:name => 'agree').click
      end
      while @browser.img(:title => 'Go to Dashboard').exists?
      @browser.img(:title => 'Go to Dashboard').click
      end
    end
  end
count=0
      50.times {
      @browser.link(:text => 'Quick Links').click
      compose= @browser.link :text => 'Compose'
      compose.exists?
      compose.click
      @browser.goto URL[:devel]+'/ma/scomm/composeBasic?type=3'
      ##@browser.span(:text => 'Acfxmbp').present? && @browser.td(:text => 'Pmbuqx').present?
      ##@browser.span(:text => 'Acfxmbp').click
      ##@browser.select_list(:id => 'recipientMask').select('Oversight Agency User')
      @browser.checkbox(:value => '175877:::All.1:::GER.1:::tester.1:::Therap Software Quality Assurance:::237050:::0').set
      @browser.checkbox(:value => '211381:::Khaled:::Adib:::Tester:::Therap Software Quality Assurance:::237050:::0').set
      add = @browser.div :xpath, "//div[@onclick='addToRecipient();']"
      add.exists?
      add.click
      #@browser.link(:text => 'From Computer').present?
      #@browser.link(:text => 'From Computer').click
      @browser.radio(:id => 'radio2').set
      $int = "The Scomm #{count}"; 
      count = count + 1  ##(65 + rand(25)).chr
      @browser.text_field(:id => 'summary').set $int
      @browser.iframe(:id => 'messageBody_ifr').send_keys 'hello world again'
      @browser.button(:value => 'Send Message').click
      sleep(5)
      }
      @browser.link(:text => 'Logout').click
      @browser.close
