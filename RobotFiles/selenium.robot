*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Facebook register
    Open Browser    http://www.facebook.com/r.php    Chrome    options=add_experimental_option("detach", True)
    Sleep    2
    Maximize Browser Window
    Sleep    2
    Click Element    xpath://button[@title='Allow all cookies']

    Page Should Contain    Create a new account

    Click Element    name:firstname
    Input Text    name:firstname    Donald

    Click Element    name:lastname
    Input Text    name:lastname    Duck

    Click Element    name:reg_email__
    Input Text    name:reg_email__    email@email.fi

    Click Element    name:reg_passwd__
    Input Password    name:reg_passwd__    password

    Click Element    name:reg_email_confirmation__
    Input Text    name:reg_email_confirmation__    email@email.fi
    Sleep    2
    Click Element    id:month
    Select From List By Label    id:month    Jul

    Click Element    id:day
    Select From List By Label    id:day    15

    Click Element    id:year
    Select From List By Label    id:year    1995

    Select Radio Button    sex    2

    Set Screenshot Directory    C:\\HAMK\\Ohjelmistotestaus\\RobotFiles
    Capture Page Screenshot    screen.png

    Close Browser

NY Times
    Open Browser    http://www.nytimes.com    Chrome    options=add_experimental_option("detach", True)
    Sleep    1
    Maximize Browser Window

    Click Button    xpath:/html/body/div[3]/div/button

    Click Button    xpath://button[@data-testid='GDPR-accept']

    ${count}=    Get Element Count    xpath:/html/body/div[1]/div[2]/div/header/div[4]/ul/li[*]/a

    ${referencePosition}=    Get Vertical Position    xpath:/html/body/div[1]/div[2]/div/header/div[4]/ul/li[1]/a

    FOR    ${index}    IN RANGE    2    ${count}    
        Log    ${index}

        # hae testattava sijainti
        ${testPosition}=    Get Vertical Position    xpath:/html/body/div[1]/div[2]/div/header/div[4]/ul/li[${index}]/a

        # vertaa sijainteja
        Should Be Equal    ${referencePosition}    ${testPosition}
    END
    Close Browser