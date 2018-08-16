*** Settings ***
Resource  ../Resources/common.robot

Test Setup    Open Browser    ${url}    ${Browser}
Test Teardown   Close Browser

*** Test Cases ***
Open Coco web page and verify view
  Maximize Browser Window
  Title Should Be    Etusivu - Cinia
  Element Should Be Visible    //div[@class='col-2 float-left']//a//img

Get Coco Helsinki Office From Maps
  Close Kaka Notification
  Activate City    ${helsinki}
  ${n_edited}    Get City String    ${helsinki_s}
  ${estring}    Removing Email From City String    ${n_edited}    ${email}
  ${city_o}    Modifyid City String To Variable   ${estring}
  Open Google Maps    ${maps}
  Searching Street Address    ${city_o}
  ${citymaps}   Catenate City And Maps    ${city_o}   ${title_end}
  Clear Search Field
  Verifying Office Address    ${citymaps}

Get Coco Tampere Office From Maps
    Close Kaka Notification
    Activate City    ${tampere}
    ${n_edited}    Get City String    ${tampere_s}
    Log   ${n_edited}
    ${estring}    Removing Email From City String    ${n_edited}    ${email}
    ${city_o}    Modifyid City String To Variable   ${estring}
    Open Google Maps    ${maps}
    Searching Street Address    ${city_o}
    ${citymaps}   Catenate City And Maps    ${city_o}   ${title_end}
    Sleep    3s
    #Wait Until Page Contains    Niulakatu 3
    Clear Search Field
    Page Should Contain    Naulakatu 3
    #Element Text Should Be    //div[@id='pane']//h1[contains(text(), 'Naulakatu 3')]    Naulakatu 3
    #Verifying Office Address    ${citymaps}

Get Coco Jyvaskyla Office From Maps
    Close Kaka Notification
    Activate City    ${jyvaskyla}
    ${n_edited}    Get City String    ${jyvaskyla_s}
    Log   ${n_edited}
    ${estring}    Removing Email From City String    ${n_edited}    ${email}
    ${city_o}    Modifyid City String To Variable   ${estring}
    Open Google Maps    ${maps}
    Searching Street Address    ${city_o}
    ${citymaps}   Catenate City And Maps    ${city_o}   ${title_end}
    Sleep    3s
    #Wait Until Page Contains    Niulakatu 3
    Clear Search Field
    Page Should Contain    Ohjelmakaari 10
    #Element Text Should Be    //div[@id='pane']//h1[contains(text(), 'Naulakatu 3')]    Naulakatu 3
    #Verifying Office Address    ${citymaps}

Get Coco Vantaa Office From Maps
    Close Kaka Notification
    Activate City    ${vantaa}
    ${n_edited}    Get City String    ${vantaa_s}
    Log   ${n_edited}
    ${estring}    Removing Email From City String    ${n_edited}    ${email}
    ${city_o}    Modifyid City String To Variable   ${estring}
    Open Google Maps    ${maps}
    Searching Street Address    ${city_o}
    ${citymaps}   Catenate City And Maps    ${city_o}   ${title_end}
    Sleep    3s
    #Wait Until Page Contains    Niulakatu 3
    Clear Search Field
    Page Should Contain    Lentoasemantie 1
    #Element Text Should Be    //div[@id='pane']//h1[contains(text(), 'Naulakatu 3')]    Naulakatu 3
    #Verifying Office Address    ${citymaps}

Get Coco Riihimaki Office From Maps
    Close Kaka Notification
    Activate City    ${riihimaki}
    ${n_edited}    Get City String    ${riihimaki_s}
    Log   ${n_edited}
    ${estring}    Removing Email From City String    ${n_edited}    ${email}
    ${city_o}    Modifyid City String To Variable   ${estring}
    Open Google Maps    ${maps}
    Searching Street Address    ${city_o}
    ${citymaps}   Catenate City And Maps    ${city_o}   ${title_end}
    Sleep    3s
    #Wait Until Page Contains    Niulakatu 3
    Clear Search Field
    #Page Should Contain    Pohjoinen Asemakatu 5
    #Element Text Should Be    //div[@id='pane']//h1[contains(text(), 'Naulakatu 3')]    Naulakatu 3
    #Verifying Office Address    ${citymaps}
