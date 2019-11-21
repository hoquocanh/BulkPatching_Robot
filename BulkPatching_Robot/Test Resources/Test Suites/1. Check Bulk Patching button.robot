*** Settings ***
Resource    ../../Test Definitions/Cucumber Definitions/General definitions.robot
Resource    ../../Test Definitions/Cucumber Definitions/Home definitions.robot
Resource    ../../Test Definitions/Cucumber Definitions/Bulk Patching definitions.robot
Resource    ../Profiles/Constant.robot


Suite Setup    Open WebUI And Go To Home Screen
Suite Teardown    Set Web UI to Stand By State and Close Current Browser

*** Test Cases ***
ADD_BULK_BUTTON_0101_Verify that imVision X shall be back to the homepage after selecting the Exit button
    Given Go To Bulk Patching Screen
    Then Bulk Patching Screen Should Be Opened
    When Exit Screen
    Then Home Screen Should Be Opened   