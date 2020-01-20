*** Settings ***
Library    SeleniumLibrary    
Library    String    

#Definition files
Resource    ../../Test_Resources/Profiles/Constant.robot
Resource    SSHDefinitions.robot
Resource    VirtualPanelDefinitions.robot

#Interface
Resource    ../Test_Pages/HomePage.robot
Resource    ../Test_Pages/SettingsPage.robot
Resource    ../Test_Pages/SelectLanguagePage.robot
*** Variables ***



*** Keywords ***
#Key work for Behavior Data Driven used in Test Cases
Go To Select Language "${language}"
       Select Language "${language}"






