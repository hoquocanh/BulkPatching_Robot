*** Settings ***
Resource    ../../../Test_Definitions/Cucumber_Definitions/GeneralDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/HomeDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/BulkPatchingDefinitions.robot
                       
#Help text.py is to store help text for checking
Variables    ../../Test_Data/HelpText.py

Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser

*** Variables ***

*** Test Cases ***
INSERT_END_B_01_01_01_Verify that The bulking patching screen will move to the other end by selecting End B button in any imVision X in the zone and observing all ImVisionX Displays
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "2"
    When Select Tab End "B"
    
    Then The Header of End B Is "active"
    
    And Plugout Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "2"

INSERT_END_B_01_01_02_Verify that The bulking patching screen will move to the other end by selecting End B button in any imVision X in the zone and observing the header of End A
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "2"
    When Select Tab End "B"
    
    Then The Header of End A Is "inactive"
    
    And Plugout Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "2"

INSERT_END_B_01_01_03_Verify that The bulking patching screen will move to the other end by selecting End B button in any imVision X in the zone and observing the help text on Display of ImVisionX
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "2"
    When Select Tab End "B"
    
    Then The Help Text Is "${txtInsertAllEndBPlugs}"
    
    And Plugout Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "2"

