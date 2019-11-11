*** Settings ***
Resource    ../../../Test Definitions/Cucumber Definitions/General definitions.robot
Resource    ../../../Test Definitions/Cucumber Definitions/Home definitions.robot
Resource    ../../../Test Definitions/Cucumber Definitions/Bulk Patching definitions.robot


Test Setup    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser

*** Variables ***
${active}=    "active"
${inactive}=    "inactive"

*** Test Cases ***

    
INSERT_END_A_01_02_Verify that imVision X shows correctly after selecting Bulk Patching button on the home page if observing the header of End A
    Given Go To Bulk Patching Screen
    Then The header of End A is "${active}"
