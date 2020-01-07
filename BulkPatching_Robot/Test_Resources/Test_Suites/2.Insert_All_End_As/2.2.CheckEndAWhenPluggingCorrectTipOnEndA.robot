*** Settings ***
Resource    ../../../Test_Definitions/Cucumber_Definitions/GeneralDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/HomeDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/BulkPatchingDefinitions.robot
                     
                     
Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser


*** Test Cases ***

INSERT_END_A_02_02_01_Verify that all ImVisionXs in the zone show the bulk patching list correctly after plugging a connector into the End A list if there is a 24-port Legacy Copper           
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    Then Check if Rack "1" Panel "1" Row "1" Port "1" "appeared" in End "A"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"

INSERT_END_A_02_02_02_Verify that all ImVisionXs in the zone show the bulk patching list correctly after plugging a connector into the End A list if there is a 48-port Legacy Copper           
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "2" Row "2" Port "48"
    Then Check if Rack "1" Panel "2" Row "2" Port "48" "appeared" in End "A"
    Then Plugout Copper Tip to Rack "1" Panel "2" Row "2" Port "48"

INSERT_END_A_02_02_06_Verify that all ImVisionXs in the zone show the bulk patching list correctly after plugging a connector into the End A list if there is a LC Fiber panel            
    Given Go To Bulk Patching Screen
    When Plugin LC Tip to Rack "1" Panel "3" Port "1"
    Then Check to see if Rack "1" Panel "3" Port "1" "appeared" in End "A"
    Then Plugout LC Tip to Rack "1" Panel "3" Port "1"

INSERT_END_A_02_02_08_Verify that all ImVisionXs in the zone show the bulk patching list correctly after plugging a connector into the End A list if there is a HDF panel            
    Given Go To Bulk Patching Screen
    When Plugin HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "1"    
    Then Check and see if Rack "1" Panel "4" ModuleHD "1" Port "1" "appeared" in End "A"
    Then Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "1"

INSERT_END_A_02_02_09_Verify that all ImVisionXs in the zone show the bulk patching list correctly after plugging a connector into the End A list if there is a 96LC fiber type            
    Given Go To Bulk Patching Screen
    When Plugin 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "1"    
    Then Check then see if Rack "1" Panel "6" Row "1" Module "A" Port "1" "appeared" in End "A"
    Then Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "1"