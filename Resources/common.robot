*** Settings ***
Library  SeleniumLibrary
Library  String


*** Variables ***
${url}    http://www.cinia.fi
${email}     etunimi.sukunimi@cinia.fi
${helsinki}   //div[@class='text-center mt-3']//span[contains(text(),'Helsinki')]
${helsinki_s}   //div[@class='text-center mt-3 js-location-holder mt-5']
${tampere}    //div[@class='text-center mt-3']//span[contains(text(),'Tampere')]
${tampere_s}    //div[@class='text-white js-single-location tampere']//span[@class='text-white mr-0 mr-md-4 mobile-width pt-3 pt-lg-0']
${vantaa}   //div[@class='text-center mt-3']//span[contains(text(),'Vantaa')]
${vantaa_s}   //div[@class='text-white js-single-location vantaa']//span[@class='text-white mr-0 mr-md-4 mobile-width pt-3 pt-lg-0']
${jyvaskyla}    //div[@class='text-center mt-3']//span[contains(text(),'Jyväskylä')]
${jyvaskyla_s}    //div[@class='text-white js-single-location jyvaskyla']//span[@class='text-white mr-0 mr-md-4 mobile-width pt-3 pt-lg-0']
${riihimaki}    //div[@class='text-center mt-3']//span[contains(text(),'Riihimäki')]
${riihimaki_s}    //div[@class='text-white js-single-location riihimaki']//span[@class='text-white mr-0 mr-md-4 mobile-width pt-3 pt-lg-0']
${maps}   https://www.google.com/maps/
${title_end}     - Google Maps
${Browser}    Chrome
*** Keywords ***
Close Kaka Notification
  Click Button    //button[@class='btn']

Activate City
  [Arguments]     ${city}
  ${m_city}   Get WebElement    ${city}
  Click Element    ${city}
  Log   ${m_city}

Get City String
  [Arguments]   ${office_a}
  ${n_edited}    Get Text    ${office_a}
  [Return]    ${n_edited}

Removing Email From City String
  [Arguments]   ${n_edited}   ${email}
  ${estring}    Remove String Using Regexp    ${n_edited}    ${email}
  [Return]    ${estring}

Modifyid City String To Variable
  [Arguments]   ${estring}
  Set Suite Variable    ${city_o}   ${estring}
  [Return]    ${city_o}

Open Google Maps
  [Arguments]   ${maps}
  Go To    ${maps}
  Title Should Be    Google Maps
  Sleep    3s

Searching Street Address
  [Arguments]   ${city_o}
  Input Text    //input[@id='searchboxinput']    ${city_o}
  Click Button    //button[@id='searchbox-searchbutton']

Clear Search Field
  Clear Element Text   //input[@id='searchboxinput']

Verifying Office Address
  [Arguments]   ${title}
  Wait Until Page Contains    Directions
  Title Should Be    ${title}
Catenate City And Maps
  [Arguments]    ${city_o}   ${title_end}
  ${citymaps}   Catenate    SEPARATOR=    ${city_o}   ${title_end}
  [Return]    ${citymaps}
