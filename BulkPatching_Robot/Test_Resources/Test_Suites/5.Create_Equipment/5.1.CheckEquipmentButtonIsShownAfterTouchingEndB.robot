*** Settings ***
Resource    ../../../Test_Definitions/Cucumber_Definitions/HomeDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/BulkPatchingDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/ConfirmDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/TraceDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/SSHDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/VirtualPanelDefinitions.robot
Resource    ../../../Test_Definitions/Test_Pages/BulkPatchingPage.robot
                       
#Help text.py is to store help text for checking
Variables    ../../Test_Data/HelpText.py

Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser

*** Variables ***

*** Test Cases ***
Create_Equip-01_01_Verify that the blue Equipment button should be shown on the screen, in the same style and position as on unguided patching screens after selecting End B if patching on a 24-port Legacy Copper 
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "1" to Port "3"  
    
    #Step 1:  
    When Select Tab End "B"
    
    #VP:Equipment button displays
    Then Equipment Button Should Be "appeared"
    
    #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
    #VP: The text "Equipment" appeared in End B
    Then Check Equipment in List "1" "appeared"

    #Step 3: Plug into porrt 4, porrt 5
    When Plugin Serial Copper Tip to Rack "1" Panel "1" Row "1" from Port "4" to Port "5"
    
    #VP: Equipment button disappeared
    Then Equipment Button Should Be "disappeared"
    
    #Step 4: Remove port 5
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "5"
    
    #VP: Equipment button displays
    Then Equipment Button Should Be "appeared"
    
    #Step 5:  Re-plug a tip into port 5
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "5"
    
    #Step 6:
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "4"
    
     #VP: Equipment button does not display
    Then Equipment Button Should Be "disappeared"
    
     #Step 7:
    When Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "5"
    
     #VP: Equipment button displays
    Then Equipment Button Should Be "appeared"
    
     #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"
    

Create_Equip-01_02_Verify that the blue Equipment button should be shown on the screen, in the same style and position as on unguided patching screens after selecting End B if patching on a 48-port Legacy Copper 
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "1" to Port "3"  
    
    #Step 1:  
    When Select Tab End "B"
    
    #VP:Equipment button displays
    Then Equipment Button Should Be "appeared"
    
    #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
    #VP: The text "Equipment" appeared in End B
    Then Check Equipment in List "1" "appeared"

    #Step 3: Plug into porrt 4, porrt 5
    When Plugin Serial Copper Tip to Rack "1" Panel "2" Row "1" from Port "4" to Port "5"
    
    #VP: Equipment button disappeared
    Then Equipment Button Should Be "disappeared"
    
    #Step 4: Remove port 5
    When Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "5"
    
    #VP: Equipment button displays
    Then Equipment Button Should Be "appeared"
    
    #Step 5:  Re-plug a tip into port 5
    When Plugin Copper Tip to Rack "1" Panel "2" Row "1" Port "5"
    
    #Step 6:
    When Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "4"
    
     #VP: Equipment button does not display
    Then Equipment Button Should Be "disappeared"
    
     #Step 7:
    When Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "5"
    
     #VP: Equipment button displays
    Then Equipment Button Should Be "appeared"
    
     #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "1"
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "2"
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "3"
    
Create_Equip-01_06_Verify that the blue Equipment button should be shown on the screen, in the same style and position as on unguided patching screens after selecting End B if patching on a LC panel 
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial LC Tip to Rack "1" Panel "3" from Port "1" to Port "3"  
    
    #Step 1:  
    When Select Tab End "B"
    
    #VP:Equipment button displays
    Then Equipment Button Should Be "appeared"
    
    #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
    #VP: The text "Equipment" appeared in End B
    Then Check Equipment in List "1" "appeared"

    #Step 3: Plug into porrt 4, porrt 5
    When Plugin Serial LC Tip to Rack "1" Panel "3" from Port "4" to Port "5"
    
    #VP: Equipment button disappeared
    Then Equipment Button Should Be "disappeared"
    
    #Step 4: Remove port 5
    When Plugout LC Tip to Rack "1" Panel "3" Port "5"
    
    #VP: Equipment button displays
    Then Equipment Button Should Be "appeared"
    
    #Step 5:  Re-plug a tip into port 5
    When Plugin LC Tip to Rack "1" Panel "3" Port "5"
    
    #Step 6:
    When Plugout LC Tip to Rack "1" Panel "3" Port "4"
    
     #VP: Equipment button does not display
    Then Equipment Button Should Be "disappeared"
    
     #Step 7:
    When Plugout LC Tip to Rack "1" Panel "3" Port "5"
    
     #VP: Equipment button displays
    Then Equipment Button Should Be "appeared"
    
     #Clean Environment
    And Plugout LC Tip to Rack "1" Panel "3" Port "1"
    And Plugout LC Tip to Rack "1" Panel "3" Port "2"
    And Plugout LC Tip to Rack "1" Panel "3" Port "3"
    
 Create_Equip-01_08_Verify that the blue Equipment button should be shown on the screen, in the same style and position as on unguided patching screens after selecting End B if patching on a HDF panel 
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "1" to Port "3"
    
    #Step 1:  
    When Select Tab End "B"
    
    #VP:Equipment button displays
    Then Equipment Button Should Be "appeared"
    
    #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
    #VP: The text "Equipment" appeared in End B
    Then Check Equipment in List "1" "appeared"

    #Step 3: Plug into porrt 4, porrt 5
    When Plugin Serial HDF Tip to Rack "1" Panel "4" ModuleHD "1" from Port "4" to Port "5"
    
    #VP: Equipment button disappeared
    Then Equipment Button Should Be "disappeared"
    
    #Step 4: Remove port 5
    When Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "5"
    
    #VP: Equipment button displays
    Then Equipment Button Should Be "appeared"
    
    #Step 5:  Re-plug a tip into port 5
    When Plugin HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "5"
    
    #Step 6:
    When Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "4"
    
     #VP: Equipment button does not display
    Then Equipment Button Should Be "disappeared"
    
     #Step 7:
    When Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "5"
    
     #VP: Equipment button displays
    Then Equipment Button Should Be "appeared"
    
     #Clean Environment
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "1"
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "2"
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "3"   

Create_Equip-01_09_Verify that the blue Equipment button should be shown on the screen, in the same style and position as on unguided patching screens after selecting End B if patching on a 96LC panel 
    #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "1" to Port "3"  
    
    #Step 1:  
    When Select Tab End "B"
    
    #VP:Equipment button displays
    Then Equipment Button Should Be "appeared"
    
    #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
    #VP: The text "Equipment" appeared in End B
    Then Check Equipment in List "1" "appeared"

    #Step 3: Plug into porrt 4, porrt 5
    When Plugin Serial 24F Tip to Rack "1" Panel "6" Row "1" Module "A" from Port "4" to Port "5"  
    
    #VP: Equipment button disappeared
    Then Equipment Button Should Be "disappeared"
    
    #Step 4: Remove port 5
    When Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "5"
    
    #VP: Equipment button displays
    Then Equipment Button Should Be "appeared"
    
    #Step 5:  Re-plug a tip into port 5
    When Plugin 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "5"
    
    #Step 6:
    When Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "4"
    
     #VP: Equipment button does not display
    Then Equipment Button Should Be "disappeared"
    
     #Step 7:
    When Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "5"
    
     #VP: Equipment button displays
    Then Equipment Button Should Be "appeared"
    
     #Clean Environment
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "1"
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "2"
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "3"
    

    
