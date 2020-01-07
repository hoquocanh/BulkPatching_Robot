*** Settings ***
Resource    ../../Test_Definitions/Cucumber_Definitions/GeneralDefinitions.robot
Resource    ../../Test_Definitions/Cucumber_Definitions/HomeDefinitions.robot
Resource    ../../Test_Definitions/Cucumber_Definitions/BulkPatchingDefinitions.robot
Resource    ../Profiles/Constant.robot


Suite Setup    Open WebUI And Go To Home Screen
Suite Teardown    Set Web UI to Stand By State and Close Current Browser

*** Test Cases ***
ADD_BULK_BUTTON_0101_Verify that imVision X shall be back to the homepage after selecting the Exit button
    Given Go To Bulk Patching Screen
    Then Bulk Patching Screen Should Be "appeared"
    When Exit Screen
    Then Home Screen Should Be Opened   