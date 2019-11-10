*** Settings ***
Library    SeleniumLibrary    
Resource    Test Resources/Profiles/Constant.robot
Resource    Test Definitions/Cucumber Definitions/Bulk Patching definitions.robot

*** Variables ***


*** Test Cases ***
Check Bulk Patching Button
    Open WebUI Screen    ${HOST}
*** Keywords ***

    



