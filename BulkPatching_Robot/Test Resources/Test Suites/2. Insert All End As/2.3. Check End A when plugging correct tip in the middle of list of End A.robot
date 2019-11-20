*** Settings ***
Resource    ../../../Test Definitions/Cucumber Definitions/General definitions.robot
Resource    ../../../Test Definitions/Cucumber Definitions/Home definitions.robot
Resource    ../../../Test Definitions/Cucumber Definitions/Bulk Patching definitions.robot

#Help text.py is to store help text for checking
Variables    ../../Test Data/Help text.py
                       
Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser


*** Test Cases ***
INSERT_END_A_03_02_Verify that imVision X shall show correctly when any connector in the middle of the End A list is unplugged and the unplugged port in red color highligted
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    Then Check if Rack "1" Panel "1" Row "1" Port "2" in End "A" color "red"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"

INSERT_END_A_03_04_Verify that imVision X shall show correctly when any connector in the middle of the End A list is unplugged and Delete button in the bottom bar showed           
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    Then Delete Button is "appeared"    
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"

INSERT_END_A_03_05_Verify that imVision X shall show correctly when any connector in the middle of the End A list is unplugged and the appropriate help text showed
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    Then The Help Text Is "${txtRestoreTheUnpluggedEndAPort}"    
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"