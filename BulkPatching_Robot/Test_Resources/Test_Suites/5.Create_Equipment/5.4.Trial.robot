*** Settings ***
Resource    ../../../Test_Definitions/Cucumber_Definitions/HomeDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/BulkPatchingDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/ConfirmDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/TraceDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/SelectLanguageDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/GeneralDefinitions.robot
Resource    ../../../Test_Definitions/Cucumber_Definitions/BulkPatchingDefinitions.robot
Resource    ../../../Test_Definitions/Test_Pages/HomePage.robot
Resource    ../../../Test_Definitions/Test_Pages/SettingsPage.robot
Resource    ../../../Test_Definitions/Test_Pages/SelectLanguagePage.robot
Resource    ../../../Test_Definitions/Test_Pages/GeneralPage.robot
Resource    ../../../Test_Definitions/Test_Pages/BulkPatchingPage.robot
                       
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
   Given Go To Select Language "korean" 
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
    Then Check Equipment Text at Path Location "E:\EquipmentTranslate.xlsx" in Language "korean" "appeared"
    
    #Clean Environment
    And Plugout Copper Tip to Rack "1" Panel "1" Row "1" Port "1"
    And Exit Screen
    And Go To Select Language "english" 
    
    
