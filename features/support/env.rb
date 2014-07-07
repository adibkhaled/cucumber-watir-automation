require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'
require 'rspec-expectations'
require 'data_magic'

World(PageObject::PageFactory)

URL = {:devel => "http://anjum.therapbd.net:7001", :production => "https://secure.therapservices.net"}
ICD9_PAGE_URL = '/ma/medicalInfo/diagnosisCode/show'
ICD10_PAGE_URL = '/ma/medicalInfo/icd10Diagnosis/show'


#TEST_DATA_DIR = "./features/support/test_data"
#DataMagic.yml_directory = './features/support/test_data/' #Tells data magic to look for data in


=begin
if ENV["HEADLESS"] then
  require "celerity"
  browser = Celerity::Browser.new
  INDEX_OFFSET = 0
  WEBDRIVER = false
else
  browser = Watir::Browser.new
  INDEX_OFFSET = -1
  WEBDRIVER = true

  Before do
    @browser = browser
  end

  at_exit do
    browser.close
  end
end
=end
