*** Settings ***
Library    SeleniumLibrary
Library    String

*** Keywords ***
Custom Failure Keyword
    [Documentation]    Custom keyword to run on failure
    Log    Custom failure keyword executed
    # You can add more actions here if needed

*** Test Cases ***
Open website
    Open Browser    http://blazedemo.com/    Chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Page Should Contain    Welcome to the Simple Travel Agency!
    Sleep    2

Choose origin and destination
    Select From List By Index    fromPort    2
    ${origin}=    Get Selected List Value    fromPort
    Sleep    1
    Select From List By Index    toPort    6
    ${destination}=    Get Selected List Value    toPort
    Sleep    1

    Set Global Variable    ${origin}
    Set Global Variable    ${destination}

    Page Should Contain Button    css:input[type='submit']
    Click Button    css:input[type='submit']

Choose flight
    Page Should Contain    Flights from ${origin} to ${destination}:
    
    @{flights}=    Get WebElements    css:table[class='table']>tbody tr
    Should Not Be Empty     ${flights}
    Sleep    1.5
    ${price1}=    Get Text    xpath:/html/body/div[2]/table/tbody/tr[1]/td[6]
    ${flight1}=    Get Text    xpath:/html/body/div[2]/table/tbody/tr[1]/td[2]
    ${airline1}=    Get Text    xpath:/html/body/div[2]/table/tbody/tr[1]/td[3]

    Set Global Variable    \${price1}
    Set Global Variable    \${flight1}
    Set Global Variable    \${airline1}

    Click Button    xpath://html/body/div[2]/table/tbody/tr[1]/td[1]/input

Check reservation and add billing details
    ${price2}=    Get Text    xpath:/html/body/div[2]/p[3]
    ${flight2}=    Get Text    xpath:/html/body/div[2]/p[2]
    ${airline2}=    Get Text    xpath:/html/body/div[2]/p[1]

    Run Keyword And Continue On Failure    Should Be Equal    ${price1}    ${price2}    Price have changed!
    Run Keyword And Continue On Failure    Should Be Equal    ${flight1}    ${flight2}    Flight have changed!
    Run Keyword And Continue On Failure    Should Be Equal    ${airline1}    ${airline2}    Airline have changed!

    ${totalCost1}=    Get Text    xpath:/html/body/div[2]/p[5]/em

    # adding personal details
    Click Element    id:inputName
    Input Text    id:inputName    Petteri Punakuono
    Sleep    0.5

    Click Element    id:address
    Input Text    id:address    Korvatunturinkatu 101
    Sleep    0.5

    Click Element    id:city
    Input Text    id:city    Joululaakso
    Sleep    0.5

    Click Element    id:state
    Input Text    id:state    Pohjoinen
    Sleep    0.5

    Click Element    id:zipCode
    Input Text    id:zipCode    12345
    Sleep    0.5

    Click Element    id:cardType
    Select From List By Index    id:cardType    2
    Sleep    0.5

    Click Element    id:creditCardNumber
    Input Text    id:creditCardNumber    9880 5555 2222 3369 77
    Sleep    0.5

    Click Element    id:creditCardMonth
    Input Text    id:creditCardMonth    12
    ${cardMonth}=    Get Value    id:creditCardMonth
    Sleep    0.5

    Click Element    id:creditCardYear
    Input Text    id:creditCardYear    2025
    ${cardYear}=    Get Value    id:creditCardYear
    Sleep    0.5

    Click Element    id:nameOnCard
    Input Text    id:nameOnCard    Punakuono Petteri

    Set Global Variable    ${cardMonth}
    Set Global Variable    ${cardYear}
    Set Global Variable    ${totalCost1}

    Click Element    id:rememberMe
    Click Element    xpath:/html/body/div[2]/form/div[11]/div/input

Finalize your order
    # check card expire dates
    Page Should Contain    Thank you for your purchase today!
    ${expireTime1}=    Set Variable    ${cardMonth} /${cardYear}
    ${expireTime2}=    Get Text    xpath:/html/body/div[2]/div/table/tbody/tr[5]/td[2]
    Run Keyword And Continue On Failure    Should Be Equal    ${expireTime1}    ${expireTime2}    Card's expire times have changed!
    
    # check total cost
    ${totalCost2}=    Get Text    xpath:/html/body/div[2]/div/table/tbody/tr[3]/td[2]
    ${totalCost2}=    Replace String    ${totalCost2}    USD    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal    ${totalCost1}    ${totalCost2}    Total cost amount has changed!

    Sleep    2

    Close Browser






    

