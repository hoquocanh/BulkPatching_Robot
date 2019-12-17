*** Settings ***
Resource    ../../../Test Definitions/Cucumber Definitions/Home definitions.robot
Resource    ../../../Test Definitions/Cucumber Definitions/Bulk Patching definitions.robot

                       
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
    Then Check The Number of Confirm is "2"
    
