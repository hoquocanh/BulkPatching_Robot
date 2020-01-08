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
INSERT_END_B_06_02_01_Verify that The screen will center the red removed port in the "END A" list when One of port in the "END A" list is removed while the "END B" is active if doing on a 24-port Legacy Copper
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "4" to Port "6"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    
    Then The Help Text Is "${txtRestoreTheUnpluggedEndAPortOrContinue}"
    
    And Plugout Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "4" to Port "6"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    