*** Settings ***
Library    String
Library    OperatingSystem
Library    C:\\HAMK\\Ohjelmistotestaus\\RobotFiles\\myLibrary.py
Library    Collections

*** Keywords ***
First Word From text
    [Arguments]    ${text}    ${index}
    @{list}=    Split String    ${text}    
    ${word}=    Set Variable    ${list}[${index}]
    [Return]    ${word}


*** Test Cases ***
New text Test    
    ${text}=    Set Variable    Red Roses and Blue sky
    ${word}=    First Word From text    ${text}    0
    Should Be Equal    ${word}    Red
    Create File    c:/HAMK/Ohjelmistotestaus/RobotFiles/word.txt    ${word}\n  

Another test case
    ${text}=    Set Variable    Red Roses and Blue sky
    ${word}=    First Word From text    ${text}    3
    Should Be Equal    ${word}    Blue
    Append to File    c:/HAMK/Ohjelmistotestaus/RobotFiles/word.txt    ${word}\n  

Test own library
    @{list}=    Create List    1    5    3
    ${value}=    Get Max From List    ${list}
    Should Be Equal    ${value}    5


Get IP Address
    ${output}=    Run And Return Rc And Output    ipconfig
    @{wordlist}=    Split String    ${output}[1]
    Log    ${wordlist}
    ${index}=    Get Index From List    ${wordlist}    Subnet

    ## jos haluan seuraavan
    # ${index}=    Evaluate    ${index}+1
    # ${index}=    Get Index From List    ${wordlist}    Subnet    ${index}

    ${index}=    Evaluate    ${index}-1
    ${IPAddress}=    Set Variable    ${wordlist}[${index}]
    Log To Console    ${IPAddress}
