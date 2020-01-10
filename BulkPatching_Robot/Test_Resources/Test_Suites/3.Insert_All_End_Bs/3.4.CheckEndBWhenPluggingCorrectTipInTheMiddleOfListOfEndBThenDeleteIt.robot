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
   #Pre-Condition
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "4" to Port "6"
    
    #Step 1:
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "5"
    
    #Step 2:
    When Click Delete Button
    
    #VP:
    Then Check if Rack "1" Panel "1" Row "1" Port "5" "disappeared" in End "B"
    Then The Help Text Is "${txtInsertAllEndBPlugs}"
    
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "6"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    And Plugout Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"
    
INSERT_END_B_04_02_02_Verify that imVision X will remove all unplugged ports from the End B list, and turn off all port LEDs after selecting Delete button in the bottom bar if there is a 48-port Legacy Copper
   #Pre-Condition
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "4" to Port "6"
    
    #Step 1:
    When Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "5"
    
    #Step 2:
    When Click Delete Button
    
    #VP:
    Then Check if Rack "1" Panel "2" Row "1" Port "5" "disappeared" in End "B"
    Then The Help Text Is "${txtInsertAllEndBPlugs}"
    
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "6"
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "4"
    And Plugout Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "3"
    
INSERT_END_B_04_02_06_Verify that imVision X will remove all unplugged ports from the End B list, and turn off all port LEDs after selecting Delete button in the bottom bar if there is a LC panel
   #Pre-Condition
    Given Go To Bulk Patching Screen
    When Plugin Serial LC Tip to Rack "1" Panel "3" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial LC Tip to Rack "1" Panel "3" from Port "4" to Port "6" 
    
    #Step 1:
    When Plugout LC Tip to Rack "1" Panel "3" Port "5"
    
    #Step 2:
    When Click Delete Button
    
    #VP:
    Then Check if Rack "1" Panel "3" Row "1" Port "5" "disappeared" in End "B"
    Then The Help Text Is "${txtInsertAllEndBPlugs}"
    
    #Clean Environment
    And Plugout LC Tip to Rack "1" Panel "3" Port "6"
    And Plugout LC Tip to Rack "1" Panel "3" Port "4"
    And Plugout Serial LC Tip to Rack "1" Panel "3" from Port "1" to Port "3"
    
INSERT_END_B_04_02_08_Verify that imVision X will remove all unplugged ports from the End B list, and turn off all port LEDs after selecting Delete button in the bottom bar if there is a HDF panel
   #Pre-Condition
    Given Go To Bulk Patching Screen
    When Plugin Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "1" to Port "3"  
    When Select Tab End "B"
    When Plugin Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "4" to Port "6"  
    
    #Step 1:
    When Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "5"
    
    #Step 2:
    When Click Delete Button
    
    #VP:
    Then Check and see if Rack "1" Panel "4" ModuleHD "1" Port "5" "disappeared" in End "B"
    Then The Help Text Is "${txtInsertAllEndBPlugs}"
    
    #Clean Environment
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "6"
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "4"
    And Plugout Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "1" to Port "3"
    
INSERT_END_B_04_02_09_Verify that imVision X will remove all unplugged ports from the End B list, and turn off all port LEDs after selecting Delete button in the bottom bar if there is a 96LC panel
   #Pre-Condition
    Given Go To Bulk Patching Screen
    When Plugin Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "1" to Port "3" 
    When Select Tab End "B"
    When Plugin Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "4" to Port "6" 
    
    #Step 1:
    When Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "5"
    
    #Step 2:
    When Click Delete Button
    
    #VP:
    Then Check then see if Rack "1" Panel "6" Row "1" Module "A" Port "5" "disappeared" in End "B"
    Then The Help Text Is "${txtInsertAllEndBPlugs}"
    
    #Clean Environment
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "6"
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "4"
    And Plugout Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "1" to Port "3"