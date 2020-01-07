*** Settings ***
Resource    ../../../Test Definitions/Cucumber Definitions/Home definitions.robot
Resource    ../../../Test Definitions/Cucumber Definitions/Bulk Patching definitions.robot

#Help text.py is to store help text for checking
Variables    ../../Test Data/Help text.py
                       
Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser


*** Test Cases ***
INSERT_END_B_03_02_Verify that imVision X shall show correctly when any connector in the middle of the End B list is unplugged and The disconnected port is highlighted in red.
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "4"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "4"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    Then Check if Rack "1" Panel "1" Row "1" Port "2" in End "B" color "red"
    And Plugout Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "4"
    And Plugout Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "4"
    

