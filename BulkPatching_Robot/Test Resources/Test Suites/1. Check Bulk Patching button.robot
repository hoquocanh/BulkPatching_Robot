*** Settings ***
Resource    ../../Test Definitions/Cucumber Definitions/General definitions.robot
Resource    ../../Test Definitions/Cucumber Definitions/Home definitions.robot
Resource    ../../Test Definitions/Cucumber Definitions/Bulk Patching definitions.robot
Resource    ../Profiles/Constant.robot
Resource    ../../Test Definitions/Test Pages/General Page.robot

Suite Setup    Open WebUI And Go To Home Screen
Suite Teardown    Set Web UI to Stand By State and Close Current Browser

Variables    ../Test Data/Help text.py

*** Variables ***
${active}    active
${inactive}    inactive

*** Test Cases ***
INSERT_END_A_01_01_Verify that imVision X shows correctly after selecting Bulk Patching button on the home page if observing all ImVisionX Displays
    Given Go To Bulk Patching Screen
    Then Bulk Patching Screen Should Be Opened
    When Exit Screen
    Then Home Screen Should Be Opened

INSERT_END_A_01_02_Verify that imVision X shows correctly after selecting Bulk Patching button on the home page if observing the header of End A
    Given Go To Bulk Patching Screen
    Then The Header of End A Is "${active}"

INSERT_END_A_01_03_Verify that imVision X shows correctly after selecting Bulk Patching button on the home page if observing the header of End B
    Given Go To Bulk Patching Screen
    Then The Header of End B Is "${inactive}"
    
INSERT_END_A_01_04_Verify that imVision X shows correctly after selecting Bulk Patching button on the home page if observing the help text on Display of ImVisionX
    Given Go To Bulk Patching Screen
    Then The Help Text Is "${txtInsertAllEndAPlugs}"