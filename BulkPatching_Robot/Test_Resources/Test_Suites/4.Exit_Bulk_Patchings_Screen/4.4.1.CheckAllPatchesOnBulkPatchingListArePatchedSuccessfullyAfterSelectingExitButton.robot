*** Settings ***
Resource    ../../../Test_Definitions/Cucumber_Definitions/HomeDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/BulkPatchingDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/ConfirmDefinitions.robot
                       
#Help text.py is to store help text for checking
Variables    ../../Test_Data/HelpText.py

Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser

*** Variables ***

*** Test Cases ***
Exit_Bulk_04_01_01_Verify that all patches on Bulk patching list are patched successfully after selecting Exit button if patching on a 24-port Legacy Copper
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "4" to Port "6"    
    And Exit Screen
    Then Bulk Patching Screen Should Be "disappeared"
    Then Confirm Button is "disappeared"
    
    And Press Copper port at Rack "1" Panel "1" Row "1" Port "1" with keymode "short"
    Then Check if Rack "1" Panel "1" Row "1" from Port "1" "appeared" in Trace screen
    Then Check if Rack "1" Panel "1" Row "1" from Port "4" "appeared" in Trace screen
    Then Check if the "full" of "Copper" Patching Bar "appeared" in Trace screen
    
    And Press Copper port at Rack "1" Panel "1" Row "1" Port "2" with keymode "short"
    Then Check if Rack "1" Panel "1" Row "1" from Port "2" "appeared" in Trace screen
    Then Check if Rack "1" Panel "1" Row "1" from Port "5" "appeared" in Trace screen
    Then Check if the "full" of "Copper" Patching Bar "appeared" in Trace screen
    
    And Press Copper port at Rack "1" Panel "1" Row "1" Port "3" with keymode "short"
    Then Check if Rack "1" Panel "1" Row "1" from Port "3" "appeared" in Trace screen
    Then Check if Rack "1" Panel "1" Row "1" from Port "6" "appeared" in Trace screen
    Then Check if the "full" of "Copper" Patching Bar "appeared" in Trace screen
    
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "5"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "6"
