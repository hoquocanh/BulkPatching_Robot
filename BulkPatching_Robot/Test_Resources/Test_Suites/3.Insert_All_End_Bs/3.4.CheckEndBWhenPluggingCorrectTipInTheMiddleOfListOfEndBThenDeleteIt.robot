*** Settings ***
Resource    ../../../Test_Definitions/Cucumber_Definitions/HomeDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/BulkPatchingDefinitions.robot
                       
#Help text.py is to store help text for checking
Variables    ../../Test_Data/HelpText.py
                       
Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser


*** Test Cases ***
INSERT_END_B_04_02_01_Verify that imVision X will remove all unplugged ports from the End B list, and turn off all port LEDs after selecting Delete button in the bottom bar if there is a 24-port Legacy Copper
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "4" to Port "6"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "5"
    When Click Delete Button
    Then Check if Rack "1" Panel "1" Row "1" Port "5" "disappeared" in End "B"
    Then The Help Text Is "${txtInsertAllEndBPlugs}"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "6"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    And Plugout Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"