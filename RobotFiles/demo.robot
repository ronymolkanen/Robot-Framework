*** Settings ***
Library    String
Library    Dialogs
Library    Collections
Library    OperatingSystem
Test Setup    Create data for tests

*** Variables ***
${one}    Donald
${two}    Duck
@{list}    1    2    3    4

*** Keywords ***
Create data for tests
    @{names}=    Create List    Donald    Mickey    Goofy    Scrooge    Daisy
    Set Test Variable    ${names}   

*** Test Cases ***
Check outcome
    ${three}=    Set Variable    Donald Duck
    Should Be Equal    ${three}    ${one} ${two}

Ask user input
    ${user}=    Get Value From User    Please input your text
    Should Be Equal    ${user}    Hello World

Check value from list
    ${number}=    Set Variable    ${list}[2]
    Log    ${list}
    Should Be Equal    ${number}    3

Add value to list
    ${addition}=    Set Variable    9
    Append To List    ${list}    ${addition}
    Log    ${list}
    Should Be Equal    ${list}[4]    ${addition}

List length
    ${length}=    Get Length    ${list}
    ${expedtedResult}=    Convert To Integer    5  
    Should Be Equal    ${length}    ${expedtedResult}

Put list in alphabetical order
    Log    ${names}
    Sort List    ${names}
    Log    ${names}
    Should Be Equal    ${names}[0]    Daisy

Remove value from list
    Remove From List    ${names}    0
    Should Be Equal    ${names}[0]    Mickey

Loop all numbers
    FOR    ${counter}    IN RANGE    1    10    
        Log    ${counter}
        ${new}=    Set Variable    ${counter}
    END

Loop the list   
    FOR    ${element}    IN    @{names}
        Log    ${element}
        ${new}=    Set Variable    ${element}
    END

Make new directory
    Create Directory    C:/HAMK/Ohjelmistotestaus/RobotFiles/RobotTesting
    Directory Should Exist    C:/HAMK/Ohjelmistotestaus/RobotFiles/RobotTesting

Create new txt tile
    ${path}=    Set Variable    C:/HAMK/Ohjelmistotestaus/RobotFiles/RobotTesting
    Create File    ${path}/example.txt    This is fun!
    File Should Exist    ${path}/example.txt
    File Should Not Be Empty    ${path}/example.txt
    Sleep    5

Delete file and folder
    ${path}=    Set Variable   C:/HAMK/Ohjelmistotestaus/RobotFiles/RobotTesting
    Remove File    ${path}/example.txt
    Directory Should Be Empty    ${path}
    Remove Directory    ${path}

PING Web page and read ping time
    ${output}=    Run And Return Rc And Output    ping www.google.com
    Log    ${output}

Read text from file and create a wordlist
    ${output}=    Get File    c:/HAMK/Ohjelmistotestaus/RobotFiles/example_text.txt
    Log    ${output}
    ${output}=    Remove String    ${output}    .    ,
    Log    ${output}
    @{wordlist}=    Split String    ${output}
    Log    ${wordlist}
    ${index}=    Get Index From List    ${wordlist}    students
    ${expedtedResult}=    Convert To Integer    24
    Should Be Equal    ${index}    ${expedtedResult}





   