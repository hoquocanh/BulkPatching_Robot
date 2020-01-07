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
INSERT_END_A_05_01_Verify that imVision X will remove all unplugged ports from the End A list, and turn off all port LEDs after selecting Delete button in the bottom bar if doing on a 24-port Legacy Copper
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    Then Click Delete Button
    Then Check if Rack "1" Panel "1" Row "1" Port "2" "disappeared" in End "A"
    Then Check if Rack "1" Panel "1" Row "1" Port "3" "disappeared" in End "A"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    Then Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"

INSERT_END_A_05_02_Verify that imVision X will remove all unplugged ports from the End A list, and turn off all port LEDs after selecting Delete button in the bottom bar if doing on a 48-port Legacy Copper
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "2" Row "1" Port "1"
    When Plugin Copper Tip to Rack "1" Panel "2" Row "1" Port "2"
    When Plugin Copper Tip to Rack "1" Panel "2" Row "1" Port "3"
    When Plugin Copper Tip to Rack "1" Panel "2" Row "1" Port "4"
    When Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "2"
    When Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "3"
    Then Click Delete Button
    Then Check if Rack "1" Panel "2" Row "1" Port "2" "disappeared" in End "A"
    Then Check if Rack "1" Panel "2" Row "1" Port "3" "disappeared" in End "A"
    Then Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "4"
    Then Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "1"

INSERT_END_A_05_06_Verify that imVision X will remove all unplugged ports from the End A list, and turn off all port LEDs after selecting Delete button in the bottom bar if doing on a LC Fiber panel 
    Given Go To Bulk Patching Screen
    When Plugin LC Tip to Rack "1" Panel "3" Port "1"
    When Plugin LC Tip to Rack "1" Panel "3" Port "2"
    When Plugin LC Tip to Rack "1" Panel "3" Port "3"
    When Plugin LC Tip to Rack "1" Panel "3" Port "4"
    When Plugout LC Tip to Rack "1" Panel "3" Port "2"
    When Plugout LC Tip to Rack "1" Panel "3" Port "3"
    Then Click Delete Button
    Then Check to see if Rack "1" Panel "3" Port "2" "disappeared" in End "A"
    Then Check to see if Rack "1" Panel "3" Port "3" "disappeared" in End "A"
    Then Plugout LC Tip to Rack "1" Panel "3" Port "4"
    Then Plugout LC Tip to Rack "1" Panel "3" Port "1"

INSERT_END_A_05_08_Verify that imVision X will remove all unplugged ports from the End A list, and turn off all port LEDs after selecting Delete button in the bottom bar if doing on a HDF panel 
    Given Go To Bulk Patching Screen
    When Plugin HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "1"
    When Plugin HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "2"
    When Plugin HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "3"
    When Plugin HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "4"
    When Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "2"
    When Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "3"
    Then Click Delete Button
    Then Check and see if Rack "1" Panel "4" ModuleHD "1" Port "2" "disappeared" in End "A"
    Then Check and see if Rack "1" Panel "4" ModuleHD "1" Port "3" "disappeared" in End "A"
    Then Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "4"
    Then Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "1"

INSERT_END_A_05_09_Verify that imVision X will remove all unplugged ports from the End A list, and turn off all port LEDs after selecting Delete button in the bottom bar if doing on a 96LC fiber type 
    Given Go To Bulk Patching Screen
    When Plugin 24F Tip to Rack "1" Panel "6" Row "1" Module "B" Port "1"
    When Plugin 24F Tip to Rack "1" Panel "6" Row "1" Module "B" Port "2"
    When Plugin 24F Tip to Rack "1" Panel "6" Row "1" Module "D" Port "3"
    When Plugin 24F Tip to Rack "1" Panel "6" Row "1" Module "D" Port "4"
    When Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "B" Port "2"
    When Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "D" Port "3"
    Then Click Delete Button
    Then Check then see if Rack "1" Panel "6" Row "1" Module "B" Port "2" "disappeared" in End "A"
    Then Check then see if Rack "1" Panel "6" Row "1" Module "D" Port "3" "disappeared" in End "A"
    Then Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "D" Port "4"
    Then Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "B" Port "1"
    
    
    

