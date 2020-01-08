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


*** Test Cases ***

INSERT_END_A_08_01_Verify that imVision X update help text "Insert all End A plugs, then select End B." after remove all excess plugs            
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "24"
    When Plugin Copper Tip to Rack "1" Panel "2" Row "2" Port "25"
    
    Then The Help Text Is "${txtMoreThan24PlugsWereInserted}"
    
    When Plugout Copper Tip to Rack "1" Panel "2" Row "2" Port "25"
    
    Then The Help Text Is "${txtInsertAllEndAPlugs}"
    Then Plugout Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "24"
