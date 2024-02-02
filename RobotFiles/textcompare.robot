*** Settings ***
Library    OperatingSystem
Library    String
Library    Collections
Library    Dialogs

*** Test Cases ***

Read text files into Variables
    ${original}=    Get File    c:/HAMK/Ohjelmistotestaus/RobotFiles/DeclarationOfIndependence.txt
    ${updated}=    Get File    c:/HAMK/Ohjelmistotestaus/RobotFiles/DeclarationOfIndependence_changed.txt
    # Create lists
    @{og_wordlist}=    Split String    ${original}
    @{upd_wordlist}=    Split String    ${updated}

    Log    ${og_wordlist}
    Log    ${upd_wordlist}
    
    # Set lists to global so they can be used again
    Set Global Variable    ${og_wordlist}
    Set Global Variable    ${upd_wordlist}

Loop through lists and compare words
    # Create list as a storage for findings
    @{differentWordsIndex}=    Create List

    # Checking that that there are same amount of words 
    ${lenght1}=    Get Length    ${og_wordlist}
    ${lenght2}=    Get Length    ${upd_wordlist}
    Should Be Equal    ${lenght1}    ${lenght2}
    
    # Compare words one by one
    FOR    ${index}    IN RANGE    ${lenght1}
        Log    ${index}
        ${word1}=    Set Variable    ${og_wordlist}[${index}]
        ${word2}=    Set Variable    ${upd_wordlist}[${index}]

        # If there is difference, save it to differentWordsIndex list
        Run Keyword If    "${word1}" != "${word2}"    Append To List    ${differentWordsIndex}    ${index}
        
    END
    Log    ${differentWordsIndex}
    Set Global Variable    ${differentWordsIndex}

Display user info
    ${length}=    Get Length    ${differentWordsIndex}
    FOR    ${index}    IN RANGE     ${length}
        log    ${length}
        
        # get the index of variable, where is the difference
        ${indexValue}=    Set Variable    ${differentWordsIndex}[${index}]

        # Print text to user        
        Pause Execution    Word ${og_wordlist}[${indexValue}] in index ${indexValue} is different in the second text file, where the word is ${upd_wordlist}[${indexValue}]
    END