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
INSERT_END_A_10_01_Verify that imVision X shall remove the port from the list when the port at the bottom of the End A list is unplugged if doing on a 24-port Legacy Copper
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "4"    
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    Then Check if Rack "1" Panel "1" Row "1" Port "4" "disappeared" in End "A"    
    When Plugout Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"

INSERT_END_A_10_02_Verify that imVision X shall remove the port from the list when the port at the bottom of the End A list is unplugged if doing on a 48-port Legacy Copper
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "4"    
    When Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "4"
    Then Check if Rack "1" Panel "2" Row "1" Port "4" "disappeared" in End "A"    
    When Plugout Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "3"

INSERT_END_A_10_06_Verify that imVision X shall remove the port from the list when the port at the bottom of the End A list is unplugged if doing on a LC Fiber panel 
    Given Go To Bulk Patching Screen
    When Plugin Serial LC Tip to Rack "1" Panel "3" from Port "1" to Port "4"    
    When Plugout LC Tip to Rack "1" Panel "3" Port "4"
    Then Check to see if Rack "1" Panel "3" Port "4" "disappeared" in End "A"    
    When Plugout Serial LC Tip to Rack "1" Panel "3" from Port "1" to Port "3"

INSERT_END_A_10_08_Verify that imVision X shall remove the port from the list when the port at the bottom of the End A list is unplugged if doing on a HDF panel 
    Given Go To Bulk Patching Screen
    When Plugin Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "1" to Port "4"    
    When Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "4"
    Then Check and see if Rack "1" Panel "4" ModuleHD "1" Port "4" "disappeared" in End "A"    
    When Plugout Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "1" to Port "3"

INSERT_END_A_10_09_Verify that imVision X shall remove the port from the list when the port at the bottom of the End A list is unplugged if doing on a 96LC fiber type 
    Given Go To Bulk Patching Screen
    When Plugin Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "1" to Port "4"    
    When Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "4"
    Then Check then see if Rack "1" Panel "6" Row "1" Module "A" Port "4" "disappeared" in End "A"    
    When Plugout Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "1" to Port "3"
    

