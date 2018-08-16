*** Settings ***
Library  SeleniumLibrary
Library  String
Test Setup    Open Browser    ${url}    chrome
Test Teardown   Close Browser

*** Variables ***
${url}    http://www.cinia.fi
${email}    etunimi.sukunimi@cinia.fi
${city}   Helsinki
${maps}   https://www.google.com/maps/
${title_end}    - Google Maps

*** Keywords ***
Close Kaka Notification
  Click Button    //button[@class='btn']

Activate City
  Click Element    //div[@class='text-center mt-3']//span[contains(text(),${city})]

Get City String
  ${n_edited}    Get Text    //div[@class='text-center mt-3 js-location-holder mt-5']
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

Verifying Office Address
  [Arguments]   ${title}
  Wait Until Page Contains    Directions
  Title Should Be    ${title}
Catenate City And Maps
  [Arguments]    ${city_o}   ${title_end}
  ${citymaps}   Catenate    SEPARATOR=    ${city_o}   ${title_end}
  [Return]    ${citymaps}

*** Test Cases ***
Open Cinia web page and verify view
  Maximize Browser Window
  Title Should Be    Etusivu - Cinia
  Element Should Be Visible    //div[@class='col-2 float-left']//a//img

Get Cinia Helsinki Office From Maps
  Close Kaka Notification
  Activate City
  ${n_edited}    Get City String
  ${estring}    Removing Email From City String    ${n_edited}    ${email}
  ${city_o}    Modifyid City String To Variable   ${estring}
  Open Google Maps    ${maps}
  Searching Street Address    ${city_o}
  ${citymaps}   Catenate City And Maps    ${city_o}   ${title_end}
  Verifying Office Address    ${citymaps}

  Get Cinia Helsinki Office From Maps
    Close Kaka Notification
    Activate City
    ${n_edited}    Get City String
    ${estring}    Removing Email From City String    ${n_edited}    ${email}
    ${city_o}    Modifyid City String To Variable   ${estring}
    Open Google Maps    ${maps}
    Searching Street Address    ${city_o}
    ${citymaps}   Catenate City And Maps    ${city_o}   ${title_end}
    Verifying Office Address    ${citymaps}
