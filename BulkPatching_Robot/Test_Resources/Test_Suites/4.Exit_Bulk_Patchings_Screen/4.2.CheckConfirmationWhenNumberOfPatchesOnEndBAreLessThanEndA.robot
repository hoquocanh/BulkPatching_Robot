*** Settings ***
Resource    ../../../Test_Definitions/Cucumber_Definitions/HomeDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/BulkPatchingDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/ConfirmDefinitions.robot
                       
#Help text.py is to store help text for checking
Variables    ../../Test Data/Help text.py

Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser

*** Variables ***

*** Test Cases ***
Exit_Bulk_02_01_01_Verify that imVision X shall create a confirm port if any port in End A / End B list is in the local controller, and the port is un-patched after selecting Exit button when there is a 24-port Legacy Copper
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "4" to Port "6"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "6"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Exit Screen
    And Go To Confirm Screen
    Then Check The Number of Confirm is "2"
    Then Check if Rack "1" Panel "1" Row "1" Port "4" "appeared" in Confirm list    
    Then Check if Rack "1" Panel "1" Row "1" Port "3" "appeared" in Confirm list
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "5"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    
Exit_Bulk_02_01_02_Verify that imVision X shall create a confirm port if any port in End A / End B list is in the local controller, and the port is un-patched after selecting Exit button when patching on a 48-port Legacy Copper
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "4" to Port "6"
    When Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "6"
    When Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "1"
    And Exit Screen
    And Go To Confirm Screen
    Then Check The Number of Confirm is "2"
    Then Check if Rack "1" Panel "2" Row "1" Port "4" "appeared" in Confirm list    
    Then Check if Rack "1" Panel "2" Row "1" Port "3" "appeared" in Confirm list
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "2"
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "5"
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "4"
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "3"    
    
Exit_Bulk_02_01_06_Verify that imVision X shall create a confirm port if any port in End A / End B list is in the local controller, and the port is un-patched after selecting Exit button when patching on a LC Fiber panel 
    Given Go To Bulk Patching Screen
    When Plugin Serial LC Tip to Rack "1" Panel "3" from Port "1" to Port "3"  
    When Select Tab End "B"
    When Plugin Serial LC Tip to Rack "1" Panel "3" from Port "4" to Port "6" 
    When Plugout LC Tip to Rack "1" Panel "3" Port "1"
    When Plugout LC Tip to Rack "1" Panel "3" Port "6"
    And Exit Screen
    And Go To Confirm Screen
    Then Check The Number of Confirm is "4"
    Then Check to see if Rack "1" Panel "3" Port "4" "appeared" in Confirm list    
    Then Check to see if Rack "1" Panel "3" Port "3" "appeared" in Confirm list
    And Plugout LC Tip to Rack "1" Panel "3" Port "2"
    And Plugout LC Tip to Rack "1" Panel "3" Port "5"
    And Plugout LC Tip to Rack "1" Panel "3" Port "4"
    And Plugout LC Tip to Rack "1" Panel "3" Port "3"    
    
Exit_Bulk_02_01_08_Verify that imVision X shall create a confirm port if any port in End A / End B list is in the local controller, and the port is un-patched after selecting Exit button when patching on a HDF panel 
    Given Go To Bulk Patching Screen
    When Plugin Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "1" to Port "3"  
    When Select Tab End "B"
    When Plugin Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "4" to Port "6" 
    When Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "6"
    When Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "1"
    And Exit Screen
    And Go To Confirm Screen
    Then Check The Number of Confirm is "4"
    Then Check and see if Rack "1" Panel "4" ModuleHD "1" Port "4" "appeared" in Confirm list
    Then Check and see if Rack "1" Panel "4" ModuleHD "1" Port "3" "appeared" in Confirm list
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "2"
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "5"
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "4"
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "3"  
    
Exit_Bulk_02_01_09_Verify that imVision X shall create a confirm port if any port in End A / End B list is in the local controller, and the port is un-patched after selecting Exit button when patching on a 96LC fiber panel 
    Given Go To Bulk Patching Screen
    When Plugin Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "1" to Port "3" 
    When Select Tab End "B"
    When Plugin Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "4" to Port "6" 
    When Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "6"
    When Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "1"
    And Exit Screen
    And Go To Confirm Screen
    Then Check The Number of Confirm is "2"
    Then Check then see if Rack "1" Panel "6" Row "1" Module "A" Port "4" "appeared" in Confirm list
    Then Check then see if Rack "1" Panel "6" Row "1" Module "A" Port "3" "appeared" in Confirm list
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "2"
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "5"
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "4"
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "3"
    
    
    
