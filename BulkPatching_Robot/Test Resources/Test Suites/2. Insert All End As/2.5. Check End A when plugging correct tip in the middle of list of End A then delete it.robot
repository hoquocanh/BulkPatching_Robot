*** Settings ***
Resource    ../../../Test Definitions/Cucumber Definitions/General definitions.robot
Resource    ../../../Test Definitions/Cucumber Definitions/Home definitions.robot
Resource    ../../../Test Definitions/Cucumber Definitions/Bulk Patching definitions.robot

#Help text.py is to store help text for checking
Variables    ../../Test Data/Help text.py
                       
Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser


*** Test Cases ***
INSERT_END_A_05_01_Verify that imVision X will remove all unplugged ports from the End A list, and turn off all port LEDs after selecting Delete button in the bottom bar if doing on a 24-port Legacy Copper
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    Then Click Delete Button
    Then Check if Rack "1" Panel "1" Row "1" Port "2" "disappeared" in End "A"
    Then Check if Rack "1" Panel "1" Row "1" Port "3" "disappeared" in End "A"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    

