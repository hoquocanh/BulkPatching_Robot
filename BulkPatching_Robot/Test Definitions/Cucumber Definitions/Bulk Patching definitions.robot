*** Settings ***
Library    SeleniumLibrary    
Resource    ../../Test Resources/Profiles/Constant.robot

*** Variables ***



*** Keywords ***

Open WebUI Screen
    [Arguments]    ${Host Name}
    
    ${WebUI url}=        Catenate    SEPARATOR=    http://   ${Host Name}    :8888             
    Open Browser    ${WebUI url}    ${BROWSER}
    Maximize Browser Window
    
Close Current Screen
    Close Browser