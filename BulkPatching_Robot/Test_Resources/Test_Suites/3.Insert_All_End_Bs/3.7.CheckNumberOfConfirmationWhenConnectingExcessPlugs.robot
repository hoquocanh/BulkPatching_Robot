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

INSERT_END_B_07_01_02_Verify that imVision X shall show correctly when plugging more ports than the ports in the End A list and generating confirm ports for the new port.            
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "4" to Port "6"
    
    #Step 1:
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "7"
    
    #Step 2:
    And Exit Screen
    
    #VP:
    Then Check The Number of Confirm is "1"
    
    #Clean Environment:
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "5"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "6"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "7"
  
INSERT_END_B_07_02_01_Verify that imVision X shall show correctly when plugging more ports than the ports in the End A list, then un-plugging them if doing on a 24-port Legacy Copper.            
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "4" to Port "6"
    
    #Step 1:
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "7"
    
    #VP:
    Then The Help Text Is "${txtMoreThan3PlugsWereInserted}"
    
    #Step 2:
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "7"
    
    #VP:
    Then The Help Text Is "${txtPressExitToCompleteBulkPatching}"
    
    #Clean Environment:
    And Plugout Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "6"
    
 INSERT_END_B_07_02_02_Verify that imVision X shall show correctly when plugging more ports than the ports in the End A list, then un-plugging them if doing on a 48-port Legacy Copper.            
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "4" to Port "6"
    
    #Step 1:
    When Plugin Copper Tip to Rack "1" Panel "2" Row "1" Port "7"
    
    #VP:
    Then The Help Text Is "${txtMoreThan3PlugsWereInserted}"
    
    #Step 2:
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "7"
    
    #VP:
    Then The Help Text Is "${txtPressExitToCompleteBulkPatching}"
    
    #Clean Environment:
    And Plugout Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "6"
    
INSERT_END_B_07_02_06_Verify that imVision X shall show correctly when plugging more ports than the ports in the End A list, then un-plugging them if doing on a LC panel.            
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial LC Tip to Rack "1" Panel "3" from Port "1" to Port "3"     
    When Select Tab End "B"
    When Plugin Serial LC Tip to Rack "1" Panel "3" from Port "4" to Port "6"
    
    #Step 1:
    When Plugin LC Tip to Rack "1" Panel "3" Port "7"
    
    #VP:
    Then The Help Text Is "${txtMoreThan3PlugsWereInserted}"
    
    #Step 2:
    And Plugout LC Tip to Rack "1" Panel "3" Port "7"
    
    #VP:
    Then The Help Text Is "${txtPressExitToCompleteBulkPatching}"
    
    #Clean Environment:
    And Plugout Serial LC Tip to Rack "1" Panel "3" from Port "1" to Port "6"
        
INSERT_END_B_07_02_08_Verify that imVision X shall show correctly when plugging more ports than the ports in the End A list, then un-plugging them if doing on a HDF panel.            
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "1" to Port "3"  
    When Select Tab End "B"
    When Plugin Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "4" to Port "6" 
    
    #Step 1:
    When Plugin HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "7"
    
    #VP:
    Then The Help Text Is "${txtMoreThan3PlugsWereInserted}"
    
    #Step 2:
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "7"
    
    #VP:
    Then The Help Text Is "${txtPressExitToCompleteBulkPatching}"
    
    #Clean Environment:
    And Plugout Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "1" to Port "6"
    
INSERT_END_B_07_02_09_Verify that imVision X shall show correctly when plugging more ports than the ports in the End A list, then un-plugging them if doing on a 96LC panel.            
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "1" to Port "3" 
    When Select Tab End "B"
    When Plugin Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "4" to Port "6" 
    
    #Step 1:
    When Plugin 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "7"
    
    #VP:
    Then The Help Text Is "${txtMoreThan3PlugsWereInserted}"
    
    #Step 2:
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "7"
    
    #VP:
    Then The Help Text Is "${txtPressExitToCompleteBulkPatching}"
    
    #Clean Environment:
    And Plugout Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "1" to Port "6"