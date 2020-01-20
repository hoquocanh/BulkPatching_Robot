*** Settings ***
Resource    ../../../Test_Definitions/Cucumber_Definitions/HomeDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/BulkPatchingDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/ConfirmDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/TraceDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/SelectLanguageDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/GeneralDefinitions.robot
Resource    ../../../Test_Definitions/Test_Pages/HomePage.robot
Resource    ../../../Test_Definitions/Test_Pages/SettingsPage.robot
Resource    ../../../Test_Definitions/Test_Pages/SelectLanguagePage.robot
Resource    ../../../Test_Definitions/Test_Pages/GeneralPage.robot
                       
#Help text.py is to store help text for checking
Variables    ../../Test_Data/HelpText.py

Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser

*** Variables ***

*** Test Cases ***
Create_Equip-03_02_02_01_Verify that ports on End A that are on the same line as the text "Equipment" on End B should be connected as Equipment connections when End A and End B have the same patches after time out if patching on a 24-port Legacy Copper
     
     #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    
     #Step 1:  
    When Select Tab End "B"
    
     #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
     #Step 3 :  
     When Exit Screen

     #Step 4 :  
     When Press Copper port at Rack "1" Panel "1" Row "1" Port "2" with keymode "short"

     #VP:
     Then Check if Rack "1" Panel "1" Row "1" Port "2" "appeared" in Trace screen
     Then Check if Equipment Connection "Unknown" "appeared" in Trace screen 
     Then Check if the "haft" of "Copper" Patching Bar "appeared" in Trace screen   

     #Step 5 :  
     When Press Copper port at Rack "1" Panel "1" Row "1" Port "1" with keymode "short"
     
     #VP:
     Then Check if Rack "1" Panel "1" Row "1" Port "1" "appeared" in Trace screen
     Then Check if Equipment Connection "Equipment" "appeared" in Trace screen   
     
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Touch Equipment Button
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "2"
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "3"

Create_Equip-03_02_02_02_Verify that ports on End A that are on the same line as the text "Equipment" on End B should be connected as Equipment connections when End A and End B have the same patches after time out if patching on a 48-port Legacy Copper
     
     #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "2" Row "1" Port "1"
    When Plugin Copper Tip to Rack "1" Panel "2" Row "1" Port "2"
    
     #Step 1:  
    When Select Tab End "B"
    
     #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
     #Step 3 :  
     When Exit Screen

     #Step 4 :  
     When Press Copper port at Rack "1" Panel "2" Row "1" Port "2" with keymode "short"

     #VP:
     Then Check if Rack "1" Panel "2" Row "1" Port "2" "appeared" in Trace screen
     Then Check if Equipment Connection "Unknown" "appeared" in Trace screen 
     Then Check if the "haft" of "Copper" Patching Bar "appeared" in Trace screen   

     #Step 5 :  
     When Press Copper port at Rack "1" Panel "2" Row "1" Port "1" with keymode "short"
     
     #VP:
     Then Check if Rack "1" Panel "2" Row "1" Port "1" "appeared" in Trace screen
     Then Check if Equipment Connection "Equipment" "appeared" in Trace screen   
     
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "1"
    And Touch Equipment Button
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "2"
    And Plugout Copper Tip to Rack "1" Panel "2" Row "1" Port "3"

Create_Equip-03_02_02_06_Verify that ports on End A that are on the same line as the text "Equipment" on End B should be connected as Equipment connections when End A and End B have the same patches after time out if patching on a LC panel
     
     #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin LC Tip to Rack "1" Panel "3" Port "1"
    When Plugin LC Tip to Rack "1" Panel "3" Port "2"
    
     #Step 1:  
    When Select Tab End "B"
    
     #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
     #Step 3 :  
     When Exit Screen

     #Step 4 :  
     When Press LC port at Rack "1" Panel "3" Port "2" with keymode "short"

     #VP:
     Then Check if Rack "1" Panel "3" Row "1" Port "2" "appeared" in Trace screen
     Then Check if Equipment Connection "Unknown" "appeared" in Trace screen 
     Then Check if the "haft" of "LC" Patching Bar "appeared" in Trace screen    

     #Step 5 :  
     When Press LC port at Rack "1" Panel "3" Port "1" with keymode "short"
     
     #VP:
     Then Check if Rack "1" Panel "3" Row "1" Port "1" "appeared" in Trace screen
     Then Check if Equipment Connection "Equipment" "appeared" in Trace screen   
     
    #Clean Environment
    And Plugout LC Tip to Rack "1" Panel "3" Port "1"
    And Touch Equipment Button
    And Plugout LC Tip to Rack "1" Panel "3" Port "2"
    And Plugout LC Tip to Rack "1" Panel "3" Port "3"

Create_Equip-03_02_02_08_Verify that ports on End A that are on the same line as the text "Equipment" on End B should be connected as Equipment connections when End A and End B have the same patches after time out if patching on a HDF panel
     
     #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "1"
    When Plugin HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "2"
    
     #Step 1:  
    When Select Tab End "B"
    
     #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
     #Step 3 :  
    When Exit Screen

     #Step 4 :  
     When Press HDF port at Rack "1" Panel "4" ModuleHD "1" Port "2" with keymode "short"

     #VP:
     Then Check if Rack "1" Panel "4" Row "1" Port "2" "appeared" in Trace screen
     Then Check if Equipment Connection "Unknown" "appeared" in Trace screen 
     Then Check if the "haft" of "LC" Patching Bar "appeared" in Trace screen 

     #Step 5 :  
     When Press HDF port at Rack "1" Panel "4" ModuleHD "1" Port "1" with keymode "short"
     
     #VP:
     Then Check if Rack "1" Panel "4" Row "1" Port "1" "appeared" in Trace screen
     Then Check if Equipment Connection "Equipment" "appeared" in Trace screen   
     
    #Clean Environment
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "1"
    And Touch Equipment Button
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "2"
    And Plugout HDF Tip to Rack "1" Panel "4" ModuleHD "1" Port "3"
    
Create_Equip-03_02_02_09_Verify that ports on End A that are on the same line as the text "Equipment" on End B should be connected as Equipment connections when End A and End B have the same patches after time out if patching on a 96LC panel
     
     #Pre-condition:
    Given Go To Bulk Patching Screen
    When Plugin 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "1"
    When Plugin 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "2"
    
     #Step 1:  
    When Select Tab End "B"
    
     #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
     #Step 3 :  
     When Exit Screen

     #Step 4 :  
     When Press 24F port at Rack "1" Panel "6" Row "1" ModuleHD "A" Port "2" with keymode "short"

     #VP:
     Then Check if Rack "1" Panel "6" Row "1" Port "2" "appeared" in Trace screen
     Then Check if Equipment Connection "Unknown" "appeared" in Trace screen 
     Then Check if the "haft" of "LC" Patching Bar "appeared" in Trace screen  

     #Step 5 :  
     When Press 24F port at Rack "1" Panel "6" Row "1" ModuleHD "A" Port "1" with keymode "short"
     
     #VP:
     Then Check if Rack "1" Panel "6" Row "1" Port "1" "appeared" in Trace screen
     Then Check if Equipment Connection "Equipment" "appeared" in Trace screen   
     
    #Clean Environment
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "1"
    And Touch Equipment Button
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "2"
    And Plugout 24F Tip to Rack "1" Panel "6" Row "1" Module "A" Port "3"