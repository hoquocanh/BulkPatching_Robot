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
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "4" to Port "6"
    
    #Step 1:
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    
    #VP:
    Then The Help Text Is "${txtRestoreTheUnpluggedEndAPortOrContinue}"
    
    #Clean Environment
    And Plugout Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "4" to Port "6"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
 
INSERT_END_B_06_02_02_Verify that The screen will center the red removed port in the "END A" list when One of port in the "END A" list is removed while the "END B" is active if doing on a 48-port Legacy Copper
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "4" to Port "6"
    
    #Step 1:
    When Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "2"
    
    #VP:
    Then The Help Text Is "${txtRestoreTheUnpluggedEndAPortOrContinue}"
    
    #Clean Environment
    And Plugout Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "4" to Port "6"
    Then Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "3"
    Then Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "1"   
    
INSERT_END_B_06_02_06_Verify that The screen will center the red removed port in the "END A" list when One of port in the "END A" list is removed while the "END B" is active if doing on a LC panel
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial LC Tip to Rack "1" Panel "3" from Port "1" to Port "3"  
    When Select Tab End "B"
    When Plugin Serial LC Tip to Rack "1" Panel "3" from Port "4" to Port "6"
    
    #Step 1:
    When Plugout LC Tip to Rack "1" Panel "3" Port "2"
    
    #VP:
    Then The Help Text Is "${txtRestoreTheUnpluggedEndAPortOrContinue}"
    
    #Clean Environment
    And Plugout Serial LC Tip to Rack "1" Panel "3" from Port "4" to Port "6"
    Then Plugout LC Tip to Rack "1" Panel "3" Port "1"
    Then Plugout LC Tip to Rack "1" Panel "3" Port "3"   
    
INSERT_END_B_06_02_08_Verify that The screen will center the red removed port in the "END A" list when One of port in the "END A" list is removed while the "END B" is active if doing on a HDF panel
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "1" to Port "3" 
    When Select Tab End "B"
    When Plugin Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "4" to Port "6"
    
    #Step 1:
    When Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "2"
    
    #VP:
    Then The Help Text Is "${txtRestoreTheUnpluggedEndAPortOrContinue}"
    
    #Clean Environment
    And Plugout Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "4" to Port "6"
    Then Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "1"
    Then Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "3"  
    
INSERT_END_B_06_02_09_Verify that The screen will center the red removed port in the "END A" list when One of port in the "END A" list is removed while the "END B" is active if doing on a 96LC panel
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "1" to Port "3"
    When Select Tab End "B"
    When Plugin Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "4" to Port "6"
    
    #Step 1:
    When Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "2"
    
    #VP:
    Then The Help Text Is "${txtRestoreTheUnpluggedEndAPortOrContinue}"
    
    #Clean Environment
    And Plugout Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "4" to Port "6"
    Then Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "1"
    Then Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "3"