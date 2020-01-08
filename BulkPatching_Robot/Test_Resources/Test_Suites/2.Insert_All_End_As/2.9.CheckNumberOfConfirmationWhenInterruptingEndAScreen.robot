*** Settings ***
Resource    ../../../Test_Definitions/Cucumber_Definitions/GeneralDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/HomeDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/BulkPatchingDefinitions.robot
                       
                       
Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser


*** Test Cases ***

INSERT_END_A_09_01_Verify that imVision X will generate confirm ports for all connectors in the End A list after selecting Exit button            
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    When Plugin Copper Tip to Rack "1" Panel "2" Row "2" Port "48"
    When Plugin LC Tip to Rack "1" Panel "3" Port "1"
    When Plugin HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "1"
    When Plugin 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "1"
    And Exit Screen
    
    Then Check The Number of Confirm is "7"
    
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    When Plugout Copper Tip to Rack "1" Panel "2" Row "2" Port "48"
    When Plugout LC Tip to Rack "1" Panel "3" Port "1"
    When Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "1"
    When Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "1"
    