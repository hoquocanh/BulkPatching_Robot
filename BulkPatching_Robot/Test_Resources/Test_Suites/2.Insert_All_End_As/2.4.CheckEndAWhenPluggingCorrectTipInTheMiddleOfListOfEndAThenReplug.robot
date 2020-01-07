*** Settings ***
Resource    ../../../Test_Definitions/Cucumber_Definitions/GeneralDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/HomeDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/BulkPatchingDefinitions.robot
                       
#Help text.py is to store help text for checking
Variables    ../../Test_Data/HelpText.py
                       
Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser


*** Test Cases ***
INSERT_END_A_04_01_Verify that imVision X shall show correctly when plugging a connector that is matched to one of unplugged connectors in the End A list and the connector is highlighted in black
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    Then Check if Rack "1" Panel "1" Row "1" Port "2" in End "A" color "red"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    Then Check if Rack "1" Panel "1" Row "1" Port "3" in End "A" color "red"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    Then Check if Rack "1" Panel "1" Row "1" Port "3" in End "A" color "black"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    Then Check if Rack "1" Panel "1" Row "1" Port "2" in End "A" color "black"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"

INSERT_END_A_04_04_Verify that imVision X shall show correctly when plugging a connector that is matched to one of unplugged connectors in the End A list and imVision X shall remove Delete button
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"    
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    Then Delete Button is "appeared"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    Then Delete Button is "disappeared"    
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"

INSERT_END_A_04_05_Verify that imVision X shall show correctly when plugging a connector that is matched to one of unplugged connectors in the End A list and the appropriate help text showed
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"    
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    Then The Help Text Is "${txtRestoreTheUnpluggedEndAPort}"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    Then The Help Text Is "${txtInsertAllEndAPlugs}"    
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"

