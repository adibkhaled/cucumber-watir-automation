require 'watir-webdriver'

class Service_directory
  
@browser.button(:value => 'Create').click
@browser.text_field(:name => 'j_id64:amount:j_id74').set 'Testing Therap'
@browser.button(:value => 'Save').click

service_informations= [['Skilled Nursing - LPN (MSP Nursing Rates Effective 4-1-2012)','T1001UCHM'],
['Skilled Nursing - RN (MSP Nursing Rates Effective 4-1-2012)','T1002UCHN'],
['Skilled Nursing (RN) - Assessment (MSP Nursing Rates Effective 4-1-2012)','T1001UCHO'],
['Skilled Respite - LPN - Day','S9125UCTE'],
['Skilled Respite - LPN - Quarter Hour','T1005UCTE'],
['Special Medical Home Care','S9122UC'],
['Specialized Mental Health Counseling','H0046UC'],
['Specialized Mental Health Counseling Assessment','H0031UC'],
['Speech Therapy','92507UC'],
['Speech Therapy - Assessment (MSP Therapy Assessment Rates Effective 4-1-2012)','92506UC'],
['Support Coordination - Full','G9012UC'],
['CDC Consultant - Full','G9012UCU5'],
['Support Coordination - Enhanced','G9012UCSC'],
['CDC Consultant - Enhanced','T2041UCU5'],
['Support Coordination - Limited','T2022UC'],
['CDC Consultant - Limited','T2022UCU5'],
['Supported Living Coaching','97535UC'],
['Transportation - Mile','A0425UC'],
['Transportation - Month','T2002UC'],
['Transportation - Trip (Unit/Freq. Limitations Effective 9-1-2011)', 'T2003UC'],
]

service_informations.each do |service_name, service_code|
    @browser.button(:value => 'Add New Service').click
    @browser.text_field(:size => '50' ).set service_name
    @browser.text_field(:size => '30').set service_code
    @browser.button(:value => 'Save').click
    break if @browser.h1(:text => 'Duplicate Code within the Service Directory. Please try with different Code').exists?
    end 
    @browser.link(:text => 'Logout').click
    
end