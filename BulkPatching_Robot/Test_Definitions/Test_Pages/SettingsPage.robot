*** Settings ***
Library    SeleniumLibrary    
Resource    ../../Test_Resources/Profiles/Constant.robot
Resource    GeneralPage.robot
Resource    HomePage.robot

*** Variables ***
#------------------Elements------------------


${btnLanguage Settings}    //div[@id='settings-language']



*** Keywords ***
    
Go To Select Language Screen
    Click Element    ${btnLanguage Settings} 
    Wait For Page Load 