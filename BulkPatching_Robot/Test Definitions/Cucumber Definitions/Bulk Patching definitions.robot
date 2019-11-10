*** Settings ***
Library    SeleniumLibrary    
Resource    ../../Test Resources/Profiles/Constant.robot

*** Variables ***



*** Keywords ***
Open WebUI Screen Default
    
    
    ${WebUI url}=        Catenate    SEPARATOR=    http://   ${HOST}    :8888             
    Open Browser    ${WebUI url}    ${BROWSER}
    Maximize Browser Window
    Set Browser Implicit Wait    1

Open WebUI Screen
    [Arguments]    ${Host Name}
    
    ${WebUI url}=        Catenate    SEPARATOR=    http://   ${Host Name}    :8888             
    Open Browser    ${WebUI url}    ${BROWSER}
    Maximize Browser Window
    Set Browser Implicit Wait    1
    
Close Current Screen
    Close Browser
    
Click Web Button
    [Arguments]    ${btnName}
    Click Element    ${btnName}    