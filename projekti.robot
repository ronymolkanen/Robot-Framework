*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Avaa nettisivu
    Open Browser    http://jimms.fi/    Chrome    options=add_experimental_option("detach", True)
    Sleep     1
    Maximize Browser Window

Testaa navbarin napppien toiminnallisuus läpi

    Mouse Up   xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]/a
    Click Link    https://www.jimms.fi/fi/Product/Tietokoneet
    Page Should Contain    Tietokoneet

    Sleep    1

    Mouse Up    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[2]/a
    Click Link    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[2]/a
    Page Should Contain    Komponentit

    Sleep    1

    Mouse Up    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[3]/a
    Click Link    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[3]/a
    Page Should Contain    Oheislaitteet

    Sleep    1

    Mouse Up    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[4]/a
    Click Link    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[4]/a
    Page Should Contain    Pelaaminen

    Sleep    1

    Mouse Up    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[5]/a
    Click Link    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[5]/a
    Page Should Contain    Verkkotuotteet

    Sleep    1

    Mouse Up    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[6]/a
    Click Link    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[6]/a
    Page Should Contain    Tarvikkeet

    Sleep    1

    Mouse Up    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[7]/a
    Click Link    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[7]/a
    Page Should Contain    Erikoistuotteet

    Sleep    1

    Mouse Up    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[8]/a
    Click Link    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[8]/a
    Page Should Contain    Ohjelmistot

    Sleep    1

    Mouse Up    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[9]/a
    Click Link    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[9]/a
    Page Should Contain    Palvelut

    Sleep    1

    Mouse Up    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[10]/a
    Click Link    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[10]/a
    Page Should Contain    Kampanjat
    
Etsi PS5 hakutoiminnolla
    Click Element    id:searchinput
    Input Text    id:searchinput    ps5
    Press Keys    xpath:/html/body/header/div/div[4]/jim-quickproductsearch/div/form/input    ENTER

   # Set Screenshot Directory    C:\Ohjelmistotestaus\Samppa\P22\RobotFiles
    Sleep    1
   Capture Element Screenshot    xpath://html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[1]/a/div/img

    #Click Link    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[1]/a
    Click Element    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[1]/a
    Page Should Contain      PS5

Löytyykö lisää ostoskoriin linkki
    Element Should Be Enabled    xpath:/html/body/main/div[1]/div[2]/div/jim-product-cta-box/div/div[2]/div[2]/addto-cart-wrapper/div/a
    Sleep    1

Kuvankaappaus lisää ostoskoriin ikonista
    Capture Element Screenshot    xpath:/html/body/main/div[1]/div[2]/div/jim-product-cta-box/div/div[2]/div[2]/addto-cart-wrapper/div/a/span
    Sleep    1

Lisää konsoli ostoskoriin
    Click Element    xpath:/html/body/main/div[1]/div[2]/div/jim-product-cta-box/div/div[2]/div[2]/addto-cart-wrapper/div/a
    Sleep    3
    Close Browser
    Sleep    1

Käyttäjän kirjautuminen
    Open Browser    http://jimms.fi/    Chrome    options=add_experimental_option("detach", True)
    Sleep     1
    Maximize Browser Window
    Click Element    xpath://html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/a/span
    Sleep    0.5

    Click Element    name:UserName
    Input Text    name:UserName    Mikael
    Sleep    0.5

    Click Element    name:Password
    Input Password    name:Password    salasana123
    Sleep    0.5

    Click Button    name:RememberMe

    Sleep    2

    Close Browser
 
Käyttäjän luominen
    Open Browser    http://jimms.fi/    Chrome    options=add_experimental_option("detach", True)
    Sleep     1
    Maximize Browser Window
    Sleep    0.5

    Click Element    xpath://html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/a/span
    Click Element    xpath://html/body/main/div/div[1]/div/div/div/div[2]/input
    Sleep    0.5

    Click Element    id:pf-EmailAddress
    Input Text    id:pf-EmailAddress    testi.gmail.com
    Sleep    0.5

    Click Element    id:pf-Password
    Input Password    id:pf-Password    salasana
    Sleep    0.5

    Click Element    id:pf-ConfirmPassword
    Input Password    id:pf-ConfirmPassword    salasana
    Sleep    0.5

    Click Element    id:pf-FirstName
    Input Text    id:pf-FirstName    Michal
    Sleep    0.5

    Click Element    id:pf-LastName
    Input Text    id:pf-LastName    Rockman 
    Sleep    0.5

    Click Element    id:pf-Address
    Input Text    id:pf-Address    Kuppakuja 6
    Sleep    0.5

    Click Element    id:pf-PostalCode
    Input Text    id:pf-PostalCode    30420
    Sleep    0.5

    Click Element    id:pf-City
    Input Text    id:pf-City    Tammere
    Sleep    0.5

    Click Element    id:pf-Phone
    Input Text    id:pf-Phone    69696969696969
    Sleep    0.5

    Scroll Element Into View    xpath://html/body/main/div/div[2]/div[2]/div/div/div/form/div[9]/input
    Sleep    0.5

    Click Button    id:pf-GDPR
    Sleep    1

Tietosuojaselosteen lukeminen ja sulkeminen    
    Click Link    xpath://html/body/main/div/div[2]/div[2]/div/div/div/form/div[8]/div/label/a

    Switch Window   NEW    
 
    Scroll Element Into View    xpath://html/body/footer/div[1]/div[1]/div[2]/div/div[2]/div/p

    Sleep    1

    Close Window

    Sleep    2

Palaa Etusivulle
    Switch Window    MAIN

    Click Element    xpath://html/body/header/div/div[2]/div/a/picture/img

    Close Browser