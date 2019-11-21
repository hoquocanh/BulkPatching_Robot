*** Settings ***

Resource    ../../../Test Definitions/Cucumber Definitions/Home definitions.robot
Resource    ../../../Test Definitions/Cucumber Definitions/Bulk Patching definitions.robot
                       
Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser

*** Test Cases ***

INSERT_END_B_02_02_01_Verify that all ImVisionXs in the zone show the bulk patching list correctly after plugging a connector into the End B list if there is a 24-port Legacy Copper           
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "2"
    When Select Tab End "B"
    Then Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    Then Check if Rack "1" Panel "1" Row "1" Port "3" "appeared" in End "B"
    Then Plugout Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"

