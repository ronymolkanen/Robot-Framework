*** Settings ***
Library    OperatingSystem
Library    String
Library    Collections

*** Test Cases ***
Lue osoitteet tiedostosta
    ${path}=    Set Variable    c:/HAMK/Ohjelmistotestaus/RobotFiles/
    ${GetData}=    Get File    ${path}webpages.txt
    Log    ${GetData} 
    ${Adresses}=    Split String    ${GetData}
    Log    ${Adresses}
    Set Global Variable    ${Adresses}

Hae pingit sivuilta ja tallenna tiedot erilliseen tiedostoon
    ${path}=    Set Variable    C:\HAMK\Ohjelmistotestaus\RobotFiles\
    ${count}=    Get Length    ${Adresses}
    Log    ${count}

    FOR    ${index}    IN RANGE    ${count}
         ${output}=    Run And Return Rc And Output   ping ${Adresses}[${index}]
         @{wordlist}=    Split String    ${output}[1]
         Log    ${wordlist}

         ${index}=    Get Index From List    ${wordlist}    Pinging
         ${index}=    Evaluate    ${index}+2
         ${IPAddress}=    Set Variable    ${wordlist}[${index}]
         Log    ${IPAddress}

         ${index2}=    Get Index From List    ${wordlist}    Average
         ${index2}=    Evaluate    ${index2}+2
        ${AveragePingWithMS}=    Set Variable    ${wordlist}[${index2}]
        ${AveragePing}=    Evaluate    "${AveragePingWithMS}".replace("ms", "")
        Log    ${AveragePing}

        Should Be True    ${AveragePing}<50
        Append To File    RobotFiles/ping_tehtava.txt    IP Address: ${IPAddress}, Average ping: ${AveragePing}ms\n        
    END

            # RONY MÖLKÄNEN
