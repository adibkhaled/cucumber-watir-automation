Given /^I am on the devel Home Page$/ do
  @therap_home_page = TestLoginPage.new(@browser)
  @therap_home_page.visit
end
When /^provide "([^\"]*)" as a login name$/ do |name|
  @therap_home_page.login_name = name
end

When /^provide "([^\"]*)" as a password$/ do |password|
  @therap_home_page.login_password = password
end

When /^provide "([^\"]*)" as a code$/ do |code|
  @therap_home_page.login_code = code
end
When /^click Login$/ do
  @therap_home_page.login_button
end
Then /^"([^\"]*)" button shows$/ do |agree|
  @therap_home_page.agree_button = agree
end