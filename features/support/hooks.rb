require 'selenium-webdriver'
require 'page-object/page_factory'

Before  do
  @browser = Watir::Browser.new
end

After do |scenario|
  begin
    if scenario.failed?
      Dir::md('screenshots') if not File.directory?('screenshots')
      screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}.png"
      @browser.driver.save_screenshot(screenshot)
      embed screenshot, 'image/png'
    end
  end
end
