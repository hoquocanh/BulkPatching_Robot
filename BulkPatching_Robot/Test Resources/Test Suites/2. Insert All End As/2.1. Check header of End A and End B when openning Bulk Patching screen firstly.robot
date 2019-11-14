*** Settings ***
Resource    ../../../Test Definitions/Cucumber Definitions/General definitions.robot
Resource    ../../../Test Definitions/Cucumber Definitions/Home definitions.robot
Resource    ../../../Test Definitions/Cucumber Definitions/Bulk Patching definitions.robot

Variables    ../../Test Data/Help text.py

Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser

*** Variables ***
${active}=    "active"
${inactive}=    "inactive"

*** Test Cases ***
INSERT_END_A_02_02_02_Verify that all ImVisionXs in the zone show the bulk patching list correctly after plugging a connector into the End A list if there is a 48-port Legacy Copper           
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Port "1"
    Then Check to see if Rack "1" Panel "1" Port "1" existed in End "A"
    Then Plugout Copper Tip to Rack "1" Panel "1" Port "1"