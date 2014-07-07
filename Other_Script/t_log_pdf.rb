require 'watir-webdriver'
require 'page-object'
require 'logger'

class TLogPdf
  #URL utiles
  URL = {:devel => "https://develop.therapbd.net", :production => "https://secure.therapservices.net"}
  PAGE_URL = '/ma/auth'
  GER_URL = '/ma/fpage2/search.do?formType=GER'
  Login_FILE_PATH = 'E:\therap\Test-automation\Other Script\login_info.csv'
  Form_FILE_PATH = 'E:\therap\Test-automation\Other Script\TLog_CSV.csv'

  #Log path define
  @log = Logger.new('E:\therap\Test-automation\Other Script\log\TLogPdf.log')

  #browser initial
  #@browser = Watir::Browser.new
  profile = Selenium::WebDriver::Firefox::Profile.new


  #PDF File Download path and PDF download code
  profile['browser.download.dir'] = "C:\\Users\\Adib\\Downloads\\Tlog_File_download"
  profile['browser.download.folderList'] = 2
  profile['browser.helperApps.neverAsk.saveToDisk'] = "application/pdf"
  profile['pdfjs.disabled'] = true
  profile['pdfjs.firstRun'] = false
  @browser = Watir::Browser.new :firefox, :profile => profile
  @browser.goto URL[:production]+PAGE_URL
  sleep(10)

  #Login Therap Application code using csv file
  File.open(Login_FILE_PATH) do |file|
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

  #Search T-log using csv file
  File.open(Form_FILE_PATH) do |file|

    while line = file.gets
      @browser.goto URL[:production]+ '/ma/fpage2/search.do?formType=LB'

      @log.info("Search Tlog Form ID " + line.split(',')[2])
      @browser.text_field(:id => 'beginDate').set(line.split(',')[1])
      @browser.text_field(:id => 'formId').set(line.split(',')[2])
      @browser.text_field(:id => 'endDate').set(line.split(',')[3])
      sleep(1)
      if @browser.td(:text => 'Lange, Melissa').exist?
        @browser.td(:text => 'Lange, Melissa').click
        @browser.link(:text, "Display Pdf").click
        @log.info @browser.title
        @log.info("Display download TLog Form ID " + line.split(',')[2])
      else
        @log.info(line.split(',')[2] + " FormId not found")
      end
    end
  end
  #Logout code
  @browser.link(:text => 'Logout').click
end