*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem
Library    String
Library    Collections

*** Variables ***
${dbname}=    robodb
${dbuser}=    testdemo
${dbpass}=    password
${dbhost}=    localhost
${dbport}=    3306
${path}=    c:/HAMK/Ohjelmistotestaus/RobotFiles/

*** Keywords ***
Make connection
    [Arguments]    ${dbtoconnect}
    Connect To Database    pymysql    ${dbtoconnect}    ${dbuser}    ${dbpass}    ${dbhost}    ${dbport}

*** Test Cases ***
Insert test Database
    Make connection    mysql
    Execute Sql String    drop database if exists ${dbname};
    Execute Sql String    Create database ${dbname};
    Execute Sql String    use ${dbname};

    ${GetCommands}=    Get File    ${path}Takkula_luonti.txt
    @{InsertCommands}=    Split String    ${GetCommands}    ;
    Log    ${InsertCommands}    
    ${TableCount}=    Get Length    ${InsertCommands}
    ${IndexToBeRemoved}=    Evaluate    ${TableCount}-1
    Remove From List    ${InsertCommands}    ${IndexToBeRemoved}
    Log    ${InsertCommands}
    ${TableCount}=    Get Length    ${InsertCommands}

    FOR    ${index}    IN RANGE    ${TableCount}
        Log    ${index}
        Execute Sql String    ${InsertCommands}[${index}]  
    END

    Set Global Variable    ${TableCount}

Insert data into tables
    Make connection    ${dbname}
     ${GetCommands}=    Get File    ${path}takkula_tiedon_lisays.txt
     @{InsertCommands}=    Split String    ${GetCommands}    ;
    Log    ${InsertCommands}    
    ${InsertCount}=    Get Length    ${InsertCommands}
    ${IndexToBeRemoved}=    Evaluate    ${InsertCount}-1
    Remove From List    ${InsertCommands}    ${IndexToBeRemoved}
    Log    ${InsertCommands}
    ${TableCount}=    Get Length    ${InsertCommands}

    FOR    ${index}    IN RANGE    ${TableCount}
        Log    ${index}
        Execute Sql String    ${InsertCommands}[${index}]  
    END

Check tables 
    Make connection    ${dbname}
    ${databaseTables}=    Query    show tables;
    ${countOfTables}=    Get Length    ${databaseTables}

    Should Be Equal    ${countOfTables}    ${TableCount}

    FOR    ${index}    IN RANGE    ${TableCount}  
        Log    ${index}
        ${table}=    Set Variable    ${databaseTables}[${index}]
        Log    ${table}
        ${table}=    Convert To String    ${table}
        ${table}=    Remove String    ${table}    ,    (    )    '
        
        Table Must Exist    ${table}
    END
