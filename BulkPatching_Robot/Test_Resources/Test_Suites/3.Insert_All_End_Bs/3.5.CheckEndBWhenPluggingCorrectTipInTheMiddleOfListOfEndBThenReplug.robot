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
INSERT_END_B_05_01_Verify that imVision X needs to generate beep tone when plugging a connector that is matched to one of unplugged connectors in the End B list if there is a 24-port Legacy Copper
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "4" to Port "6"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "5"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "5"
    
    Then Check if Rack "1" Panel "1" Row "1" Port "5" in End "B" color "black"
    Then The Help Text Is "${txtRestoreTheUnpluggedEndBPort}"
    
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    
    Then Check if Rack "1" Panel "1" Row "1" Port "4" in End "B" color "black"
    Then The Help Text Is "${txtPressExitToCompleteBulkPatching}"
    
    And Plugout Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "4" to Port "6"
    And Plugout Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"

