*** Settings ***

Resource    ../../../Test_Definitions/Cucumber_Definitions/GeneralDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/HomeDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/BulkPatchingDefinitions.robot
                       
                       
Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser

*** Test Cases ***

INSERT_END_B_02_02_01_Verify that all ImVisionXs in the zone show the bulk patching list correctly after plugging a connector into the End B list if there is a 24-port Legacy Copper           
    #Pre-Condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "2"
     
    #Step 1:
    When Select Tab End "B"
    
    #Step 2:
    Then Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    
    #VP:
    Then Check if Rack "1" Panel "1" Row "1" Port "3" "appeared" in End "B"
    
    #Clean Environment:
    Then Plugout Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"

INSERT_END_B_02_02_02_Verify that all ImVisionXs in the zone show the bulk patching list correctly after plugging a connector into the End B list if there is a 48-port Legacy Copper           
    #Pre-Condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "2"
    
    #Step 1:
    When Select Tab End "B"
    
    #Step 2L:
    Then Plugin Copper Tip to Rack "1" Panel "2" Row "1" Port "3"
    
    #VP:
    Then Check if Rack "1" Panel "2" Row "1" Port "3" "appeared" in End "B"
    
    #Clean Environment
    Then Plugout Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "3"
    
INSERT_END_B_02_02_06_Verify that all ImVisionXs in the zone show the bulk patching list correctly after plugging a connector into the End B list if there is a LC panel           
    #Pre-Condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial LC Tip to Rack "1" Panel "3" from Port "1" to Port "2"
    
    #Step 1:
    When Select Tab End "B"
    
    #Step 2L:
    Then Plugin LC Tip to Rack "1" Panel "3" Port "3"
    
    #VP:
    Then Check if Rack "1" Panel "3" Row "1" Port "3" "appeared" in End "B"
    
    #Clean Environment
    Then Plugout Serial LC Tip to Rack "1" Panel "3" from Port "1" to Port "3"
    
   
INSERT_END_B_02_02_08_Verify that all ImVisionXs in the zone show the bulk patching list correctly after plugging a connector into the End B list if there is a HDF panel           
    #Pre-Condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "1" to Port "2"
    
    #Step 1:
    When Select Tab End "B"
    
    #Step 2L:
    Then Plugin HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "3"
    
    #VP:
    Then Check and see if Rack "1" Panel "4" ModuleHD "1" Port "3" "appeared" in End "B"
    
    #Clean Environment
    Then Plugout Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "1" to Port "3"
    
INSERT_END_B_02_02_09_Verify that all ImVisionXs in the zone show the bulk patching list correctly after plugging a connector into the End B list if there is a 96LC panel           
    #Pre-Condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "1" to Port "2"
    
    #Step 1:
    When Select Tab End "B"
    
    #Step 2L:
    Then Plugin 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "3"
    
    #VP:
    Then Check then see if Rack "1" Panel "6" Row "1" Module "A" Port "3" "appeared" in End "B"
    
    #Clean Environment
    Then Plugout Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "1" to Port "3"
    