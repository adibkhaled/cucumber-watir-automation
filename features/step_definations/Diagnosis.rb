Given /^I am click on the Code ICD-9 New Page$/ do
  @therap_diagnosis_page = TestIDiagnosisPage.new(@browser)
  @therap_diagnosis_page.new_ICD9
end
When /^provide "([^\"]*)" as a diagnosis code$/ do |code|
  @therap_diagnosis_page.diagnosis_code = code
end
When /^provide "([^\"]*)" as a code Type$/ do |codeType|
  @therap_diagnosis_page.diagnosis_codeType = codeType
end
When /^provide "([^\"]*)" as Description$/ do |description|
  @therap_diagnosis_page.diagnosis_description = description
end
When /^click ICD9 Save$/ do
  @therap_diagnosis_page.save_button
end
Then /^shows "([^\"]*)" message in ICD9 done page$/ do |diagnosis_save_message|
  @therap_diagnosis_page.diagnosis_save_message = diagnosis_save_message
end

Given /^I am click on the Code ICD-10 New Page$/ do
  @therap_diagnosis_page.new_ICD10
end
When /^provide "([^\"]*)" as a IC10diagnosis code$/ do |code|
  @therap_diagnosis_page.diagnosis_ICD10_code = code
end
When /^provide "([^\"]*)" as ICD10 Description$/ do |description|
  @therap_diagnosis_page.diagnosis_ICD10_description =description
end
When /^click ICD10 Save$/ do
  @therap_diagnosis_page.save_button
end
Then /^shows "([^\"]*)" message in ICD10 done page$/ do |diagnosis_save_message|
  @therap_diagnosis_page.diagnosis_save_message = diagnosis_save_message
end