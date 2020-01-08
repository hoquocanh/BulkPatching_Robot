*** Settings ***

Resource    ../../../Test_Definitions/Cucumber_Definitions/HomeDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/BulkPatchingDefinitions.robot
                       
                      
Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser


*** Test Cases ***

INSERT_END_B_07_01_02_Verify that imVision X shall show correctly when plugging more ports than the ports in the End A list and generating confirm ports for the new port.            
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"    
    When Select Tab End "B"
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "4" to Port "6"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "7"
    And Exit Screen
    
    Then Check The Number of Confirm is "1"
    
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "5"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "6"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "7"
    