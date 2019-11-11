*** Settings ***
Library    SeleniumLibrary    
Resource    ../../Test Resources/Profiles/Constant.robot
Resource    General definitions.robot

Resource    ../Test Pages/Home Page.robot
*** Variables ***



*** Keywords ***
Home Screen Should Be Opened
    Page Should Contain Element    ${lblimVisionX}
    
Go To Bulk Patching Screen
    Click Element    ${btnBulk Patching} 
    Wait For Page Load 
    
  