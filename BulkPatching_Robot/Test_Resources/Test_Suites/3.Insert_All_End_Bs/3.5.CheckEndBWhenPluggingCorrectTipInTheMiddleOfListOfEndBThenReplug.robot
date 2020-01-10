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
    #Pre-Condition:  
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "4" to Port "6"
    
    #Step 1:
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "5"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    
    #Step 2:
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "5"
    
    #VP:
    Then Check if Rack "1" Panel "1" Row "1" Port "5" in End "B" color "black"
    Then The Help Text Is "${txtRestoreTheUnpluggedEndBPort}"
    
    #Step 3:
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    
    #VP:
    Then Check if Rack "1" Panel "1" Row "1" Port "4" in End "B" color "black"
    Then The Help Text Is "${txtPressExitToCompleteBulkPatching}"
   
    #Clean Environment: 
    And Plugout Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "4" to Port "6"
    And Plugout Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"

INSERT_END_B_05_02_Verify that imVision X needs to generate beep tone when plugging a connector that is matched to one of unplugged connectors in the End B list if there is a 48-port Legacy Copper
    #Pre-Condition:  
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "4" to Port "6"
    
    #Step 1:
    When Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "5"
    When Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "4"
    
    #Step 2:
    When Plugin Copper Tip to Rack "1" Panel "2" Row "1" Port "5"
    
    #VP:
    Then Check if Rack "1" Panel "2" Row "1" Port "5" in End "B" color "black"
    Then The Help Text Is "${txtRestoreTheUnpluggedEndBPort}"
    
    #Step 3:
    When Plugin Copper Tip to Rack "1" Panel "2" Row "1" Port "4"
    
    #VP:
    Then Check if Rack "1" Panel "2" Row "1" Port "4" in End "B" color "black"
    Then The Help Text Is "${txtPressExitToCompleteBulkPatching}"
   
    #Clean Environment: 
    And Plugout Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "4" to Port "6"
    And Plugout Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "3"
    
INSERT_END_B_05_06_Verify that imVision X needs to generate beep tone when plugging a connector that is matched to one of unplugged connectors in the End B list if there is a LC panel
    #Pre-Condition:  
    Given Go To Bulk Patching Screen
    When Plugin Serial LC Tip to Rack "1" Panel "3" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial LC Tip to Rack "1" Panel "3" from Port "4" to Port "6" 
    
    #Step 1:
    When Plugout LC Tip to Rack "1" Panel "3" Port "5"
    When Plugout LC Tip to Rack "1" Panel "3" Port "4"
    
    #Step 2:
    When Plugin LC Tip to Rack "1" Panel "3" Port "5"
    
    #VP:
    Then Check if Rack "1" Panel "3" Row "1" Port "5" in End "B" color "black"
    Then The Help Text Is "${txtRestoreTheUnpluggedEndBPort}"
    
    #Step 3:
    When Plugin LC Tip to Rack "1" Panel "3" Port "4"
    
    #VP:
    Then Check if Rack "1" Panel "3" Row "1" Port "4" in End "B" color "black"
    Then The Help Text Is "${txtPressExitToCompleteBulkPatching}"
   
    #Clean Environment: 
    And Plugout Serial LC Tip to Rack "1" Panel "3" from Port "4" to Port "6"
    And Plugout Serial LC Tip to Rack "1" Panel "3" from Port "1" to Port "3"
    
INSERT_END_B_05_08_Verify that imVision X needs to generate beep tone when plugging a connector that is matched to one of unplugged connectors in the End B list if there is a HDF panel
    #Pre-Condition:  
    Given Go To Bulk Patching Screen
    When Plugin Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "1" to Port "3"   
    When Select Tab End "B"
    When Plugin Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "4" to Port "6" 
    
    #Step 1:
    When Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "5"
    When Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "4"
    
    #Step 2:
    When Plugin HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "5"
    
    #VP:
    Then Check and see color if Rack "1" Panel "4" ModuleHD "1" Port "5" "appeared" in End "B" color "black"
    Then The Help Text Is "${txtRestoreTheUnpluggedEndBPort}"
    
    #Step 3:
    When Plugin HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "4"
    
    #VP:
    Then Check and see color if Rack "1" Panel "4" ModuleHD "1" Port "4" "appeared" in End "B" color "black"
    Then The Help Text Is "${txtPressExitToCompleteBulkPatching}"
   
    #Clean Environment: 
    And Plugout Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "4" to Port "6"
    And Plugout Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "1" to Port "3"

INSERT_END_B_05_09_Verify that imVision X needs to generate beep tone when plugging a connector that is matched to one of unplugged connectors in the End B list if there is a 96LC panel
    #Pre-Condition:  
    Given Go To Bulk Patching Screen
    When Plugin Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "1" to Port "3"  
    When Select Tab End "B"
    When Plugin Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "4" to Port "6" 
    
    #Step 1:
    When Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "5"
    When Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "4"
    
    #Step 2:
    When Plugin 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "5"
    
    #VP:
    Then Check then see color if Rack "1" Panel "6" Row "1" Module "A" Port "5" "appeared" in End "B" color "black"
    Then The Help Text Is "${txtRestoreTheUnpluggedEndBPort}"
    
    #Step 3:
    When Plugin 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "4"
    
    #VP:
    Then Check then see color if Rack "1" Panel "6" Row "1" Module "A" Port "4" "appeared" in End "B" color "black"
    Then The Help Text Is "${txtPressExitToCompleteBulkPatching}"
   
    #Clean Environment: 
    And Plugout Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "1" to Port "3"
    And Plugout Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "4" to Port "6"