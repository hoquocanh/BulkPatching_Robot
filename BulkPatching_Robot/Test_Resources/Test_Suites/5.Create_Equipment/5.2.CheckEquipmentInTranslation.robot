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
Resource    ../../../Test_Definitions/Test_Pages/BulkPatchingPage.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/BulkPatchingDefinitions.robot
                       
#Help text.py is to store help text for checking
Variables    ../../Test_Data/HelpText.py

Test Setup    Run Keywords    
...    Open SSH Connection and Login
...    Open WebUI And Go To Home Screen
Test Teardown    Set Web UI to Stand By State and Close Current Browser

*** Variables ***

*** Test Cases ***
Create_Equip-02_01_Verify that "Equipment" should use the same translation as the text in the "Equipment" button if changing to Danish
   
    #Pre-condition:
   Given Go To Select Language "danish" 
    Given Go To Home Screen
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    
     #Step 1:  
    When Select Tab End "B"
    
    #VP:Equipment button displays
    Then Equipment Button Should Be "appeared"
    
     #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
    #VP: The text "Equipment" appeared in End B
    Then Check Equipment Text at Path Location "E:\EquipmentTranslate.xlsx" in Language "danish" "appeared"
    
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Exit Screen
    And Go To Select Language "english" 
   
Create_Equip-02_02_Verify that "Equipment" should use the same translation as the text in the "Equipment" button if changing to German
   
    #Pre-condition:
   Given Go To Select Language "german" 
    Given Go To Home Screen
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    
     #Step 1:  
    When Select Tab End "B"
    
    #VP:Equipment button displays
    Then Equipment Button Should Be "appeared"
    
     #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
    #VP: The text "Equipment" appeared in End B
    Then Check Equipment Text at Path Location "E:\EquipmentTranslate.xlsx" in Language "german" "appeared"
    
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Exit Screen
    And Go To Select Language "english" 

Create_Equip-02_03_Verify that "Equipment" should use the same translation as the text in the "Equipment" button if changing to English
   
    #Pre-condition:
   Given Go To Select Language "english" 
    Given Go To Home Screen
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    
     #Step 1:  
    When Select Tab End "B"
    
    #VP:Equipment button displays
    Then Equipment Button Should Be "appeared"
    
     #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
    #VP: The text "Equipment" appeared in End B
    Then Check Equipment Text at Path Location "E:\EquipmentTranslate.xlsx" in Language "english" "appeared"
    
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Exit Screen
    And Go To Select Language "english" 
    
Create_Equip-02_04_Verify that "Equipment" should use the same translation as the text in the "Equipment" button if changing to Spainish
   
    #Pre-condition:
   Given Go To Select Language "spainish" 
    Given Go To Home Screen
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    
     #Step 1:  
    When Select Tab End "B"
    
    #VP:Equipment button displays
    Then Equipment Button Should Be "appeared"
    
     #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
    #VP: The text "Equipment" appeared in End B
    Then Check Equipment Text at Path Location "E:\EquipmentTranslate.xlsx" in Language "spainish" "appeared"
    
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Exit Screen
    And Go To Select Language "english" 
    
Create_Equip-02_05_Verify that "Equipment" should use the same translation as the text in the "Equipment" button if changing to French
   
    #Pre-condition:
   Given Go To Select Language "french" 
    Given Go To Home Screen
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    
     #Step 1:  
    When Select Tab End "B"
    
    #VP:Equipment button displays
    Then Equipment Button Should Be "appeared"
    
     #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
    #VP: The text "Equipment" appeared in End B
    Then Check Equipment Text at Path Location "E:\EquipmentTranslate.xlsx" in Language "french" "appeared"
    
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Exit Screen
    And Go To Select Language "english" 
    
Create_Equip-02_06_Verify that "Equipment" should use the same translation as the text in the "Equipment" button if changing to Italian
   
    #Pre-condition:
   Given Go To Select Language "italian" 
    Given Go To Home Screen
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    
     #Step 1:  
    When Select Tab End "B"
    
    #VP:Equipment button displays
    Then Equipment Button Should Be "appeared"
    
     #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
    #VP: The text "Equipment" appeared in End B
    Then Check Equipment Text at Path Location "E:\EquipmentTranslate.xlsx" in Language "italian" "appeared"
    
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Exit Screen
    And Go To Select Language "english" 
    
Create_Equip-02_07_Verify that "Equipment" should use the same translation as the text in the "Equipment" button if changing to Polish
   
    #Pre-condition:
   Given Go To Select Language "Polish" 
    Given Go To Home Screen
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    
     #Step 1:  
    When Select Tab End "B"
    
    #VP:Equipment button displays
    Then Equipment Button Should Be "appeared"
    
     #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
    #VP: The text "Equipment" appeared in End B
    Then Check Equipment Text at Path Location "E:\EquipmentTranslate.xlsx" in Language "Polish" "appeared"
    
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Exit Screen
    And Go To Select Language "english" 
    
Create_Equip-02_08_Verify that "Equipment" should use the same translation as the text in the "Equipment" button if changing to Portuguese
   
    #Pre-condition:
   Given Go To Select Language "Portuguese" 
    Given Go To Home Screen
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    
     #Step 1:  
    When Select Tab End "B"
    
    #VP:Equipment button displays
    Then Equipment Button Should Be "appeared"
    
     #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
    #VP: The text "Equipment" appeared in End B
    Then Check Equipment Text at Path Location "E:\EquipmentTranslate.xlsx" in Language "Portuguese" "appeared"
    
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Exit Screen
    And Go To Select Language "english" 
    
Create_Equip-02_09_Verify that "Equipment" should use the same translation as the text in the "Equipment" button if changing to Russian
   
    #Pre-condition:
   Given Go To Select Language "Russian" 
    Given Go To Home Screen
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    
     #Step 1:  
    When Select Tab End "B"
    
    #VP:Equipment button displays
    Then Equipment Button Should Be "appeared"
    
     #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
    #VP: The text "Equipment" appeared in End B
    Then Check Equipment Text at Path Location "E:\EquipmentTranslate.xlsx" in Language "Russian" "appeared"
    
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Exit Screen
    And Go To Select Language "english" 
    
Create_Equip-02_10_Verify that "Equipment" should use the same translation as the text in the "Equipment" button if changing to Chinese
   
    #Pre-condition:
   Given Go To Select Language "Chinese" 
    Given Go To Home Screen
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    
     #Step 1:  
    When Select Tab End "B"
    
    #VP:Equipment button displays
    Then Equipment Button Should Be "appeared"
    
     #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
    #VP: The text "Equipment" appeared in End B
    Then Check Equipment Text at Path Location "E:\EquipmentTranslate.xlsx" in Language "Chinese" "appeared"
    
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Exit Screen
    And Go To Select Language "english" 
    
Create_Equip-02_11_Verify that "Equipment" should use the same translation as the text in the "Equipment" button if changing to Korean
   
    #Pre-condition:
   Given Go To Select Language "Korean" 
    Given Go To Home Screen
    Given Go To Bulk Patching Screen
    When Plugin Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    
     #Step 1:  
    When Select Tab End "B"
    
    #VP:Equipment button displays
    Then Equipment Button Should Be "appeared"
    
     #Step 2 :  Touch Equipment
    When Touch Equipment Button
    
    #VP: The text "Equipment" appeared in End B
    Then Check Equipment Text at Path Location "E:\EquipmentTranslate.xlsx" in Language "Korean" "appeared"
    
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Exit Screen
    And Go To Select Language "english" 