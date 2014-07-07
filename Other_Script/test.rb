require 'watir-webdriver'
require 'selenium-webdriver'
require 'logger'

class Test
  URL = { :devel => "https://develop.therapbd.net" ,:production => "https://beta.therapservices.net"}
  PAGE_URL = '/ma/auth'
  GER_URL = '/ma/fpage2/search.do?formType=GER'
  Login_FILE_PATH = 'E:\therap\Test-automation\Other Script\login_info.csv'
  Form_FILE_PATH = 'E:\therap\Test-automation\Other Script\GER_CSV.csv'
  Download_dir = 'E:\therap\Test-automation\Other Script'
  @log = Logger.new('E:\therap\Test-automation\Other Script\log\GERPdf.log')



  @browser = Watir::Browser.new
  profile = Selenium::WebDriver::Firefox::Profile.new



  #Please change the directory path
  profile['browser.download.dir'] = "C:\\Users\\Adib\\Downloads\\GER_File_download"
  profile['browser.download.folderList'] = 2
  profile['browser.helperApps.neverAsk.saveToDisk'] = "application/pdf"
  profile['pdfjs.disabled'] = true
  profile['pdfjs.firstRun'] = false
  @browser = Watir::Browser.new :firefox, :profile => profile
  @browser.goto URL[:devel]+PAGE_URL


  @browser.text_field(:id => 'loginName').set('ger_all')
  @browser.text_field(:id => 'password').set('therap')
  @browser.text_field(:id => 'providerCode').set('SQA-TH')
  login= @browser.button :name => 'submitButton'
  login.exists?
  login.click
  File.open(Form_FILE_PATH) do | file|

    while line = file.gets
  @browser.goto URL[:devel]+ '/ma/fpage2/search.do?formType=GER'
  @log.info("** Search Ger Form ID **" + line.split(',')[1])
  @browser.text_field(:id => 'beginDate').set('06/01/2014')
  @browser.text_field(:id => 'formId').set('GER-SQANY-C8R2SY8X3DF7H')
  @browser.text_field(:id => 'endDate').set('06/24/2014')
  Search = @browser.button :value => 'Search'
  Search.exist?
  Search.click
  @browser.td(:text => "GER-SQANY-C8R2SY8X3DF7H").click
  @log.info @browser.title
  @browser.link(:text, "Display Printable (PDF)").click
  @log.info("Display download Ger Form ID " + line.split(',')[1])
    end
    end
end