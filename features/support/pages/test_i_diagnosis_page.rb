require 'watir-webdriver'
require 'page-object'
require './features/support/env'

class TestIDiagnosisPage
  include PageObject

  def initialize(browser)
    @browser = browser
  end
 #page url

  def new_ICD9
    @browser.goto URL[:devel]+ICD9_PAGE_URL
  end

  def new_ICD10
    @browser.goto URL[:devel]+ICD10_PAGE_URL
  end
  
  #Text Field
  def diagnosis_code=(code)
    @browser.text_field(:id => 'code').set(code)
  end

  def diagnosis_codeType=(codeType)
    @browser.select_list(:id => 'codeType').select(codeType)
  end

  def diagnosis_description=(description)
    @browser.text_field(:id => 'description').set(description)
  end

  def diagnosis_ICD10_code=(code)
    @browser.text_field(:id => 'code').set(code)
  end

  def diagnosis_ICD10_description=(description)
    @browser.text_field(:id => 'description').set(description)
  end

  # Button
  def save_button
    @browser.button(:name => 'saveButton').click
  end

  def save_and_create_new
    @browser.button(:name => 'saveAndNew').click
  end

  #Message checking
  def diagnosis_save_message=(diagnosis_save_message)
    @browser.text.include?(diagnosis_save_message).should == true
  end
end