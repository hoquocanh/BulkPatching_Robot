*** Settings ***
Resource    ../../../Test_Definitions/Cucumber_Definitions/HomeDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/BulkPatchingDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/ConfirmDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/TraceDefinitions.robot
                       
#Help text.py is to store help text for checking
Variables    ../../Test_Data/HelpText.py

Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser

*** Variables ***

*** Test Cases ***
Exit_Bulk_04_01_01_Verify that all patches on Bulk patching list are patched successfully after selecting Exit button if patching on a 24-port Legacy Copper
   #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "4" to Port "6"  
    
    #Step 1:  
    And Exit Screen
    
    #VP:
    Then Bulk Patching Screen Should Be "disappeared"
    Then Confirm Button is "disappeared"
    
    #Step 2:
    And Press Copper port at Rack "1" Panel "1" Row "1" Port "1" with keymode "short"
    
    #VP:
    Then Check if Rack "1" Panel "1" Row "1" Port "1" "appeared" in Trace screen
    Then Check if Rack "1" Panel "1" Row "1" Port "4" "appeared" in Trace screen
    Then Check if the "full" of "Copper" Patching Bar "appeared" in Trace screen
    
    #Step 3:
    And Press Copper port at Rack "1" Panel "1" Row "1" Port "2" with keymode "short"
    
    #VP:
    Then Check if Rack "1" Panel "1" Row "1" Port "2" "appeared" in Trace screen
    Then Check if Rack "1" Panel "1" Row "1" Port "5" "appeared" in Trace screen
    Then Check if the "full" of "Copper" Patching Bar "appeared" in Trace screen
    
    #Step 4:
    And Press Copper port at Rack "1" Panel "1" Row "1" Port "3" with keymode "short"
    
    #VP:
    Then Check if Rack "1" Panel "1" Row "1" Port "3" "appeared" in Trace screen
    Then Check if Rack "1" Panel "1" Row "1" Port "6" "appeared" in Trace screen
    Then Check if the "full" of "Copper" Patching Bar "appeared" in Trace screen
    
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "5"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "6"

Exit_Bulk_04_01_02_Verify that all patches on Bulk patching list are patched successfully after selecting Exit button if patching on a 48-port Legacy Copper
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "4" to Port "6"  
    
    #Step 1:  
    And Exit Screen
    
    #VP:
    Then Bulk Patching Screen Should Be "disappeared"
    Then Confirm Button is "disappeared"
    
    #Step 2:
    And Press Copper port at Rack "1" Panel "2" Row "1" Port "1" with keymode "short"
    
    #VP:
    Then Check if Rack "1" Panel "2" Row "1" Port "1" "appeared" in Trace screen
    Then Check if Rack "1" Panel "2" Row "1" Port "4" "appeared" in Trace screen
    Then Check if the "full" of "Copper" Patching Bar "appeared" in Trace screen
    
    #Step 3:
    And Press Copper port at Rack "1" Panel "2" Row "1" Port "2" with keymode "short"
    
    #VP:
    Then Check if Rack "1" Panel "2" Row "1" Port "2" "appeared" in Trace screen
    Then Check if Rack "1" Panel "2" Row "1" Port "5" "appeared" in Trace screen
    Then Check if the "full" of "Copper" Patching Bar "appeared" in Trace screen
    
    #Step 4:
    And Press Copper port at Rack "1" Panel "2" Row "1" Port "3" with keymode "short"
    
    #VP:
    Then Check if Rack "1" Panel "2" Row "1" Port "3" "appeared" in Trace screen
    Then Check if Rack "1" Panel "2" Row "1" Port "6" "appeared" in Trace screen
    Then Check if the "full" of "Copper" Patching Bar "appeared" in Trace screen
    
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "1"
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "4"
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "2"
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "5"
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "3"
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "6"
    
Exit_Bulk_04_01_06_Verify that all patches on Bulk patching list are patched successfully after selecting Exit button if patching on a LC panel
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial LC Tip to Rack "1" Panel "3" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial LC Tip to Rack "1" Panel "3" from Port "4" to Port "6"  
    
    #Step 1:  
    And Exit Screen
    
    #VP:
    Then Bulk Patching Screen Should Be "disappeared"
    Then Confirm Button is "disappeared"
    
    #Step 2:
    And Press LC port at Rack "1" Panel "3" Port "1" with keymode "short"
    
    #VP:
    Then Check if Rack "1" Panel "3" Row "1" Port "1" "appeared" in Trace screen
    Then Check if Rack "1" Panel "3" Row "1" Port "4" "appeared" in Trace screen
    Then Check if the "full" of "LC" Patching Bar "appeared" in Trace screen
    
    #Step 3:
    And Press LC port at Rack "1" Panel "3" Port "2" with keymode "short"
    
    #VP:
    Then Check if Rack "1" Panel "3" Row "1" Port "2" "appeared" in Trace screen
    Then Check if Rack "1" Panel "3" Row "1" Port "5" "appeared" in Trace screen
    Then Check if the "full" of "LC" Patching Bar "appeared" in Trace screen
    
    #Step 4:
    And Press LC port at Rack "1" Panel "3" Port "3" with keymode "short"
    
    #VP:
    Then Check if Rack "1" Panel "3" Row "1" Port "3" "appeared" in Trace screen
    Then Check if Rack "1" Panel "3" Row "1" Port "6" "appeared" in Trace screen
    Then Check if the "full" of "LC" Patching Bar "appeared" in Trace screen
    
    #Clean Environment
    And Plugout LC Tip to Rack "1" Panel "3" Port "1"
    And Plugout LC Tip to Rack "1" Panel "3" Port "4"
    And Plugout LC Tip to Rack "1" Panel "3" Port "2"
    And Plugout LC Tip to Rack "1" Panel "3" Port "5"
    And Plugout LC Tip to Rack "1" Panel "3" Port "3"
    And Plugout LC Tip to Rack "1" Panel "3" Port "6"
    
Exit_Bulk_04_01_08_Verify that all patches on Bulk patching list are patched successfully after selecting Exit button if patching on a HDF panel
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "4" to Port "6"  
    
    #Step 1:  
    And Exit Screen
    
    #VP:
    Then Bulk Patching Screen Should Be "disappeared"
    Then Confirm Button is "disappeared"
    
    #Step 2:
    And Press HDF port at Rack "1" Panel "4" ModuleHD "1" Port "1" with keymode "short"
    
    #VP:
    Then Check if Rack "1" Panel "4" Row "1" Port "1" "appeared" in Trace screen
    Then Check if Rack "1" Panel "4" Row "1" Port "4" "appeared" in Trace screen
    Then Check if the "full" of "LC" Patching Bar "appeared" in Trace screen
    
    #Step 3:
    And Press HDF port at Rack "1" Panel "4" ModuleHD "1" Port "2" with keymode "short"
    
    #VP:
    Then Check if Rack "1" Panel "4" Row "1" Port "2" "appeared" in Trace screen
    Then Check if Rack "1" Panel "4" Row "1" Port "5" "appeared" in Trace screen
    Then Check if the "full" of "LC" Patching Bar "appeared" in Trace screen
    
    #Step 4:
    And Press HDF port at Rack "1" Panel "4" ModuleHD "1" Port "3" with keymode "short"
    
    #VP:
    Then Check if Rack "1" Panel "4" Row "1" Port "3" "appeared" in Trace screen
    Then Check if Rack "1" Panel "4" Row "1" Port "6" "appeared" in Trace screen
    Then Check if the "full" of "LC" Patching Bar "appeared" in Trace screen
    
    #Clean Environment
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "1"
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "4"
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "2"
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "5"
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "3"
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "6"
    
Exit_Bulk_04_01_09_Verify that all patches on Bulk patching list are patched successfully after selecting Exit button if patching on a 96LC panel
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "1" to Port "3"   
    When Select Tab End "B"
    When Plugin Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "4" to Port "6"  
    
    #Step 1:  
    And Exit Screen
    
    #VP:
    Then Bulk Patching Screen Should Be "disappeared"
    Then Confirm Button is "disappeared"
    
    #Step 2:
    And Press 24F port at Rack "1" Panel "6" Row "1" ModuleHD "A" Port "1" with keymode "short"
    
    #VP:
    Then Check if Rack "1" Panel "6" Row "1" Port "1" "appeared" in Trace screen
    Then Check if Rack "1" Panel "6" Row "1" Port "4" "appeared" in Trace screen
    Then Check if the "full" of "LC" Patching Bar "appeared" in Trace screen
    
    #Step 3:
    And Press 24F port at Rack "1" Panel "6" Row "1" ModuleHD "A" Port "2" with keymode "short"
    
    #VP:
    Then Check if Rack "1" Panel "6" Row "1" Port "2" "appeared" in Trace screen
    Then Check if Rack "1" Panel "6" Row "1" Port "5" "appeared" in Trace screen
    Then Check if the "full" of "LC" Patching Bar "appeared" in Trace screen
    
    #Step 4:
    And Press 24F port at Rack "1" Panel "6" Row "1" ModuleHD "A" Port "3" with keymode "short"
    
    #VP:
    Then Check if Rack "1" Panel "6" Row "1" Port "3" "appeared" in Trace screen
    Then Check if Rack "1" Panel "6" Row "1" Port "6" "appeared" in Trace screen
    Then Check if the "full" of "LC" Patching Bar "appeared" in Trace screen
    
    #Clean Environment
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "1"
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "4"
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "2"
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "5"
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "3"
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "6"